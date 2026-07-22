import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/use_cases/set_repository_favorite.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/use_cases/watch_favorites.dart';

part 'favorites_bloc.freezed.dart';
part 'favorites_event.dart';
part 'favorites_state.dart';

final class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({
    required WatchFavorites watchFavorites,
    required SetRepositoryFavorite setRepositoryFavorite,
  }) : _watchFavorites = watchFavorites,
       _setRepositoryFavorite = setRepositoryFavorite,
       super(const FavoritesState()) {
    on<FavoritesStarted>(_onStarted);
    on<FavoriteSetRequested>(_onSetRequested);
  }

  final WatchFavorites _watchFavorites;
  final SetRepositoryFavorite _setRepositoryFavorite;

  Future<void> _onStarted(
    FavoritesStarted event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(state.copyWith(status: FavoritesStatus.loading, failure: null));
    await emit.forEach<Result<List<GithubRepository>>>(
      _watchFavorites(),
      onData: (result) => switch (result) {
        Success<List<GithubRepository>>(:final data) => state.copyWith(
          status: FavoritesStatus.success,
          repositories: data,
          failure: null,
        ),
        FailureResult<List<GithubRepository>>(:final failure) => state.copyWith(
          status: FavoritesStatus.failure,
          failure: failure,
        ),
      },
    );
  }

  Future<void> _onSetRequested(
    FavoriteSetRequested event,
    Emitter<FavoritesState> emit,
  ) async {
    final pending = {...state.pendingRepositoryIds, event.repository.id};
    emit(
      state.copyWith(
        pendingRepositoryIds: pending,
        operationFailure: null,
      ),
    );
    final result = await _setRepositoryFavorite(
      event.repository,
      isFavorite: event.isFavorite,
    );
    if (emit.isDone) return;
    final remaining = {...state.pendingRepositoryIds}
      ..remove(event.repository.id);
    switch (result) {
      case Success<void>():
        emit(state.copyWith(pendingRepositoryIds: remaining));
      case FailureResult<void>(:final failure):
        emit(
          state.copyWith(
            pendingRepositoryIds: remaining,
            operationFailure: failure,
          ),
        );
    }
  }
}
