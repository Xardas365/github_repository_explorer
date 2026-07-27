part of 'search_bloc.dart';

enum SearchStatus { initial, loading, success, empty, failure }

@freezed
abstract class SearchPageFailure with _$SearchPageFailure {
  const factory SearchPageFailure({
    required int page,
    required Failure failure,
  }) = _SearchPageFailure;
}

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default(SearchStatus.initial) SearchStatus status,
    @Default('') String query,
    @Default(<int, RepositoryPage>{}) Map<int, RepositoryPage> pages,
    int? loadingPage,
    @Default(false) bool isRefreshing,
    Failure? failure,
    SearchPageFailure? pageFailure,
  }) = _SearchState;
}

extension SearchStateX on SearchState {
  List<GithubRepository> get repositories {
    final repositoriesById = <int, GithubRepository>{};
    final pageNumbers = pages.keys.toList()..sort();
    for (final pageNumber in pageNumbers) {
      for (final repository in pages[pageNumber]!.repositories) {
        repositoriesById.putIfAbsent(repository.id, () => repository);
      }
    }
    return List.unmodifiable(repositoriesById.values);
  }

  int get currentPage {
    var page = 0;
    while (pages.containsKey(page + 1)) {
      page++;
    }
    return page;
  }

  bool get hasReachedEnd {
    final lastPage = pages[currentPage];
    return lastPage != null && !lastPage.hasNextPage;
  }

  bool get isLoadingNextPage => switch (loadingPage) {
    final page? when page > 1 => true,
    _ => false,
  };

  bool get isFromCache =>
      pages.values.any((page) => page.origin == DataOrigin.cache);

  bool get isStale => pages.values.any((page) => page.isStale);

  DateTime? get fetchedAt {
    final cachedDates = pages.values
        .where((page) => page.origin == DataOrigin.cache)
        .map((page) => page.fetchedAt);
    if (cachedDates.isEmpty) return null;
    return cachedDates.reduce(
      (oldest, candidate) => candidate.isBefore(oldest) ? candidate : oldest,
    );
  }

  Failure? get refreshFailure => pages[1]?.refreshFailure;

  SearchPageFailure? get paginationPageFailure {
    final explicitFailure = pageFailure;
    if (explicitFailure != null && explicitFailure.page > 1) {
      return explicitFailure;
    }
    final pageNumbers = pages.keys.where((page) => page > 1).toList()..sort();
    for (final pageNumber in pageNumbers) {
      final failure = pages[pageNumber]?.refreshFailure;
      if (failure != null) {
        return SearchPageFailure(page: pageNumber, failure: failure);
      }
    }
    return null;
  }

  Failure? get paginationFailure => paginationPageFailure?.failure;

  int? get paginationFailurePage => paginationPageFailure?.page;
}
