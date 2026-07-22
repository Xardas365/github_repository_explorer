part of 'favorites_bloc.dart';

@freezed
sealed class FavoritesEvent with _$FavoritesEvent {
  const factory FavoritesEvent.started() = FavoritesStarted;
  const factory FavoritesEvent.setRequested({
    required GithubRepository repository,
    required bool isFavorite,
  }) = FavoriteSetRequested;
}
