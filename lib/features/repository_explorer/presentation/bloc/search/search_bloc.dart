import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_page.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_search_request.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/use_cases/search_repositories.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

EventTransformer<E> debounceRestartable<E>(
  Duration duration, {
  int Function()? cancellationToken,
  int Function(E event)? eventCancellationToken,
}) {
  final currentCancellationToken = cancellationToken ?? () => 0;
  return (events, mapper) => restartable<E>().call(
    events
        .map(
          (event) => (
            event: event,
            cancellationToken:
                eventCancellationToken?.call(event) ??
                currentCancellationToken(),
          ),
        )
        .debounce(duration)
        .where(
          (pending) => pending.cancellationToken == currentCancellationToken(),
        )
        .map((pending) => pending.event),
    mapper,
  );
}

final class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required SearchRepositories searchRepositories})
    : _searchRepositories = searchRepositories,
      super(const SearchState()) {
    on<SearchQueryChanged>(
      _onQueryChanged,
      transformer: debounceRestartable(
        const Duration(milliseconds: 450),
        cancellationToken: () => _passiveSearchCancellationToken,
        eventCancellationToken: (event) =>
            _passiveSearchEventTokens[event] ?? _passiveSearchCancellationToken,
      ),
    );
    on<SearchSubmitted>(_onSubmitted);
    on<SearchLoadNextPage>(_onLoadNextPage, transformer: droppable());
    on<SearchPageRetried>(_onPageRetried);
    on<SearchRefreshed>(_onRefreshed);
  }

  final SearchRepositories _searchRepositories;
  final Expando<int> _passiveSearchEventTokens = Expando<int>();
  int _requestId = 0;
  int _passiveSearchCancellationToken = 0;
  String? _activeQuery;
  int? _activePage;
  int? _activeRequestId;
  StreamIterator<Result<RepositoryPage>>? _activeSearch;

  @override
  void onEvent(SearchEvent event) {
    super.onEvent(event);
    if (event is SearchQueryChanged) {
      _passiveSearchEventTokens[event] = _passiveSearchCancellationToken;
    } else if (event is SearchSubmitted) {
      _passiveSearchCancellationToken++;
    }
  }

  Future<void> _onQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) => _search(query: event.query, emit: emit, page: 1);

  Future<void> _onSubmitted(
    SearchSubmitted event,
    Emitter<SearchState> emit,
  ) => _search(query: event.query, emit: emit, page: 1);

  Future<void> _onLoadNextPage(
    SearchLoadNextPage event,
    Emitter<SearchState> emit,
  ) async {
    if (state.query.isEmpty ||
        state.hasReachedEnd ||
        state.loadingPage != null ||
        state.paginationFailure != null ||
        state.status != SearchStatus.success) {
      return;
    }
    await _search(
      query: state.query,
      emit: emit,
      page: state.currentPage + 1,
    );
  }

  Future<void> _onPageRetried(
    SearchPageRetried event,
    Emitter<SearchState> emit,
  ) async {
    if (state.query.isEmpty || event.page < 1) return;
    await _search(
      query: state.query,
      emit: emit,
      page: event.page,
      forceRefresh: true,
      preserveItems: state.pages.isNotEmpty,
    );
  }

  Future<void> _onRefreshed(
    SearchRefreshed event,
    Emitter<SearchState> emit,
  ) async {
    if (state.query.isEmpty) return;
    await _search(
      query: state.query,
      emit: emit,
      page: 1,
      forceRefresh: true,
      preserveItems: true,
    );
  }

  Future<void> _search({
    required String query,
    required Emitter<SearchState> emit,
    required int page,
    bool forceRefresh = false,
    bool preserveItems = false,
  }) async {
    final normalized = query.trim().replaceAll(RegExp(r'\s+'), ' ');
    if (normalized.length < 2) {
      final requestId = ++_requestId;
      await _cancelActiveSearch();
      if (requestId != _requestId || emit.isDone) return;
      emit(SearchState(query: normalized));
      return;
    }

    if (!forceRefresh &&
        _activeRequestId == _requestId &&
        _activeQuery == normalized &&
        _activePage == page) {
      return;
    }

    final requestId = ++_requestId;
    await _cancelActiveSearch();
    if (requestId != _requestId || emit.isDone) return;
    _activeQuery = normalized;
    _activePage = page;
    _activeRequestId = requestId;
    if (page == 1) {
      emit(
        preserveItems
            ? state.copyWith(
                query: normalized,
                loadingPage: page,
                isRefreshing: true,
                failure: null,
              )
            : SearchState(
                status: SearchStatus.loading,
                query: normalized,
                loadingPage: page,
              ),
      );
    } else {
      final retainedPageFailure = state.pageFailure?.page == page
          ? null
          : state.pageFailure;
      emit(
        state.copyWith(
          loadingPage: page,
          pageFailure: retainedPageFailure,
        ),
      );
    }

    final request = RepositorySearchRequest(
      query: normalized,
      page: page,
      forceRefresh: forceRefresh,
    );
    final search = StreamIterator<Result<RepositoryPage>>(
      _searchRepositories(request),
    );
    _activeSearch = search;
    try {
      while (await search.moveNext()) {
        final result = search.current;
        if (requestId != _requestId || emit.isDone) return;
        switch (result) {
          case Success<RepositoryPage>(:final data):
            final pages = Map<int, RepositoryPage>.of(state.pages);
            if (data.origin == DataOrigin.network) {
              pages.removeWhere((pageNumber, _) => pageNumber > data.page);
            }
            pages[data.page] = data;
            var retainedPageFailure = state.pageFailure;
            if (retainedPageFailure != null &&
                (retainedPageFailure.page == data.page ||
                    data.origin == DataOrigin.network &&
                        retainedPageFailure.page > data.page)) {
              retainedPageFailure = null;
            }
            final repositories = _flattenPages(pages);
            final continuesRevalidation =
                data.origin == DataOrigin.cache &&
                data.isStale &&
                data.refreshFailure == null;
            emit(
              state.copyWith(
                status: repositories.isEmpty
                    ? SearchStatus.empty
                    : SearchStatus.success,
                query: normalized,
                pages: pages,
                loadingPage: continuesRevalidation ? page : null,
                isRefreshing:
                    page == 1 && continuesRevalidation && preserveItems,
                failure: null,
                pageFailure: retainedPageFailure,
              ),
            );
          case FailureResult<RepositoryPage>(:final failure):
            if (page > 1) {
              emit(
                state.copyWith(
                  loadingPage: null,
                  pageFailure: SearchPageFailure(
                    page: page,
                    failure: failure,
                  ),
                ),
              );
            } else if (preserveItems && state.repositories.isNotEmpty) {
              final pages = Map<int, RepositoryPage>.of(state.pages);
              final firstPage = pages[1];
              if (firstPage != null) {
                pages[1] = firstPage.copyWith(refreshFailure: failure);
              }
              emit(
                state.copyWith(
                  pages: pages,
                  loadingPage: null,
                  isRefreshing: false,
                ),
              );
            } else {
              emit(
                state.copyWith(
                  status: SearchStatus.failure,
                  loadingPage: null,
                  isRefreshing: false,
                  failure: failure,
                ),
              );
            }
        }
      }
    } finally {
      await search.cancel();
      if (identical(_activeSearch, search)) {
        _activeSearch = null;
      }
      if (_activeRequestId == requestId) {
        _activeQuery = null;
        _activePage = null;
        _activeRequestId = null;
      }
    }
  }

  @override
  Future<void> close() async {
    _requestId++;
    await _cancelActiveSearch();
    return super.close();
  }

  Future<void> _cancelActiveSearch() async {
    final activeSearch = _activeSearch;
    _activeSearch = null;
    _activeQuery = null;
    _activePage = null;
    _activeRequestId = null;
    await activeSearch?.cancel();
  }

  List<GithubRepository> _flattenPages(Map<int, RepositoryPage> pages) {
    final repositoriesById = <int, GithubRepository>{};
    final pageNumbers = pages.keys.toList()..sort();
    for (final pageNumber in pageNumbers) {
      for (final repository in pages[pageNumber]!.repositories) {
        repositoriesById.putIfAbsent(repository.id, () => repository);
      }
    }
    return repositoriesById.values.toList(growable: false);
  }
}
