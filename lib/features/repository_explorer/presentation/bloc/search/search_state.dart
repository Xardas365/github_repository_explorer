part of 'search_bloc.dart';

enum SearchStatus { initial, loading, success, empty, failure }

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default(SearchStatus.initial) SearchStatus status,
    @Default('') String query,
    @Default(<GithubRepository>[]) List<GithubRepository> repositories,
    @Default(0) int currentPage,
    @Default(false) bool hasReachedEnd,
    @Default(false) bool isLoadingNextPage,
    @Default(false) bool isRefreshing,
    @Default(false) bool isFromCache,
    @Default(false) bool isStale,
    DateTime? fetchedAt,
    Failure? failure,
    Failure? refreshFailure,
    Failure? paginationFailure,
  }) = _SearchState;
}
