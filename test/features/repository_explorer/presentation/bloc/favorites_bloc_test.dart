import 'package:bloc_test/bloc_test.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/repositories/favorite_repositories_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/use_cases/set_repository_favorite.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/use_cases/watch_favorites.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../helpers/fixtures.dart';

final class _MockFavoritesRepository extends Mock
    implements FavoriteRepositoriesRepository {}

void main() {
  late _MockFavoritesRepository repository;

  setUpAll(() {
    registerFallbackValue(sampleRepository);
  });

  setUp(() {
    repository = _MockFavoritesRepository();
  });

  FavoritesBloc buildBloc() => FavoritesBloc(
    watchFavorites: WatchFavorites(repository),
    setRepositoryFavorite: SetRepositoryFavorite(repository),
  );

  blocTest<FavoritesBloc, FavoritesState>(
    'loads persisted favorites from the repository stream',
    setUp: () {
      when(() => repository.watchFavorites()).thenAnswer(
        (_) => Stream.value(Result.success([sampleRepository])),
      );
    },
    build: buildBloc,
    act: (bloc) => bloc.add(const FavoritesEvent.started()),
    expect: () => [
      isA<FavoritesState>().having(
        (state) => state.status,
        'status',
        FavoritesStatus.loading,
      ),
      isA<FavoritesState>()
          .having((state) => state.status, 'status', FavoritesStatus.success)
          .having((state) => state.repositories, 'repositories', [
            sampleRepository,
          ]),
    ],
  );

  blocTest<FavoritesBloc, FavoritesState>(
    'persists a favorite and clears the pending marker on success',
    setUp: () {
      when(
        () => repository.setFavorite(
          any(),
          isFavorite: any(named: 'isFavorite'),
        ),
      ).thenAnswer((_) async => const Result.success(null));
    },
    build: buildBloc,
    act: (bloc) => bloc.add(
      FavoritesEvent.setRequested(
        repository: sampleRepository,
        isFavorite: true,
      ),
    ),
    expect: () => [
      isA<FavoritesState>().having(
        (state) => state.pendingRepositoryIds,
        'pendingRepositoryIds',
        {sampleRepository.id},
      ),
      isA<FavoritesState>().having(
        (state) => state.pendingRepositoryIds,
        'pendingRepositoryIds',
        isEmpty,
      ),
    ],
    verify: (_) {
      verify(
        () => repository.setFavorite(
          sampleRepository,
          isFavorite: true,
        ),
      ).called(1);
    },
  );

  blocTest<FavoritesBloc, FavoritesState>(
    'reports a persistence failure without leaving the item pending',
    setUp: () {
      when(
        () => repository.setFavorite(
          any(),
          isFavorite: any(named: 'isFavorite'),
        ),
      ).thenAnswer(
        (_) async => const Result.failure(Failure.cache()),
      );
    },
    build: buildBloc,
    act: (bloc) => bloc.add(
      FavoritesEvent.setRequested(
        repository: sampleRepository,
        isFavorite: true,
      ),
    ),
    expect: () => [
      isA<FavoritesState>().having(
        (state) => state.pendingRepositoryIds,
        'pendingRepositoryIds',
        isNotEmpty,
      ),
      isA<FavoritesState>()
          .having(
            (state) => state.pendingRepositoryIds,
            'pendingRepositoryIds',
            isEmpty,
          )
          .having(
            (state) => state.operationFailure,
            'operationFailure',
            isA<CacheFailure>(),
          ),
    ],
  );
}
