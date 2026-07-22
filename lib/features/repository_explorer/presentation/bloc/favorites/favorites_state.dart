part of 'favorites_bloc.dart';

enum FavoritesStatus { initial, loading, success, failure }

@freezed
abstract class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default(FavoritesStatus.initial) FavoritesStatus status,
    @Default(<GithubRepository>[]) List<GithubRepository> repositories,
    @Default(<int>{}) Set<int> pendingRepositoryIds,
    Failure? failure,
    Failure? operationFailure,
  }) = _FavoritesState;
}

extension FavoritesStateX on FavoritesState {
  bool contains(int repositoryId) =>
      repositories.any((repository) => repository.id == repositoryId);
}
