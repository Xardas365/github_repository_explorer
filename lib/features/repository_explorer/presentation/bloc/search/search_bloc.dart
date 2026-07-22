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
    on<SearchRetried>(_onRetried);
    on<SearchRefreshed>(_onRefreshed);
  }

  final SearchRepositories _searchRepositories;
  final Expando<int> _passiveSearchEventTokens = Expando<int>();
  int _requestId = 0;
  int _passiveSearchCancellationToken = 0;

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
        state.isLoadingNextPage ||
        state.status != SearchStatus.success) {
      return;
    }
    await _search(
      query: state.query,
      emit: emit,
      page: state.currentPage + 1,
    );
  }

  Future<void> _onRetried(
    SearchRetried event,
    Emitter<SearchState> emit,
  ) async {
    if (state.query.isEmpty) return;
    final retryPage = state.paginationFailure == null
        ? (state.currentPage == 0 ? 1 : state.currentPage)
        : state.currentPage + 1;
    await _search(
      query: state.query,
      emit: emit,
      page: retryPage,
      forceRefresh: true,
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
      _requestId++;
      emit(SearchState(query: normalized));
      return;
    }

    final requestId = ++_requestId;
    if (page == 1) {
      emit(
        state.copyWith(
          status: preserveItems ? state.status : SearchStatus.loading,
          query: normalized,
          repositories: preserveItems ? state.repositories : const [],
          currentPage: preserveItems ? state.currentPage : 0,
          isRefreshing: preserveItems,
          isLoadingNextPage: false,
          failure: null,
          refreshFailure: null,
          paginationFailure: null,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoadingNextPage: true,
          paginationFailure: null,
        ),
      );
    }

    final request = RepositorySearchRequest(
      query: normalized,
      page: page,
      forceRefresh: forceRefresh,
    );
    await for (final result in _searchRepositories(request)) {
      if (requestId != _requestId || emit.isDone) return;
      switch (result) {
        case Success<RepositoryPage>(:final data):
          final repositories = page == 1
              ? data.repositories
              : _mergeById(state.repositories, data.repositories);
          emit(
            state.copyWith(
              status: repositories.isEmpty
                  ? SearchStatus.empty
                  : SearchStatus.success,
              query: normalized,
              repositories: repositories,
              currentPage: data.page,
              hasReachedEnd: !data.hasNextPage,
              isLoadingNextPage: false,
              isRefreshing: false,
              isFromCache: data.origin == DataOrigin.cache,
              isStale: data.isStale,
              fetchedAt: data.fetchedAt,
              failure: null,
              refreshFailure: data.refreshFailure,
              paginationFailure: null,
            ),
          );
        case FailureResult<RepositoryPage>(:final failure):
          if (page > 1) {
            emit(
              state.copyWith(
                isLoadingNextPage: false,
                paginationFailure: failure,
              ),
            );
          } else if (preserveItems && state.repositories.isNotEmpty) {
            emit(
              state.copyWith(
                isRefreshing: false,
                refreshFailure: failure,
              ),
            );
          } else {
            emit(
              state.copyWith(
                status: SearchStatus.failure,
                isRefreshing: false,
                failure: failure,
              ),
            );
          }
      }
    }
  }

  List<GithubRepository> _mergeById(
    List<GithubRepository> existing,
    List<GithubRepository> incoming,
  ) {
    final byId = <int, GithubRepository>{
      for (final repository in existing) repository.id: repository,
      for (final repository in incoming) repository.id: repository,
    };
    return byId.values.toList(growable: false);
  }
}
