import 'package:dio/dio.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:github_repository_explorer/core/cache/cache_policy.dart';
import 'package:github_repository_explorer/core/logging/app_logger.dart';
import 'package:github_repository_explorer/core/network/dio_factory.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/data_sources/github_remote_data_source.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/data_sources/repository_local_data_source.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/database/app_database.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/repositories/favorite_repositories_repository_impl.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/repositories/repository_search_repository_impl.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/repositories/favorite_repositories_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/repositories/repository_search_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/use_cases/search_repositories.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/use_cases/set_repository_favorite.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/use_cases/watch_favorites.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/bloc/search/search_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt
    ..registerLazySingleton<Dio>(createDio)
    ..registerLazySingleton<Clock>(SystemClock.new)
    ..registerLazySingleton<CachePolicy>(CachePolicy.new)
    ..registerLazySingleton<AppLogger>(DeveloperAppLogger.new)
    ..registerLazySingleton<AppDatabase>(
      () => AppDatabase(driftDatabase(name: 'github_repository_explorer')),
      dispose: (database) => database.close(),
    )
    ..registerLazySingleton<GithubRemoteDataSource>(
      () => DioGithubRemoteDataSource(
        getIt(),
        clock: getIt(),
        logger: getIt(),
      ),
    )
    ..registerLazySingleton<RepositoryLocalDataSource>(
      () => DriftRepositoryLocalDataSource(getIt(), logger: getIt()),
    )
    ..registerLazySingleton<RepositorySearchRepository>(
      () => RepositorySearchRepositoryImpl(
        remote: getIt(),
        local: getIt(),
        cachePolicy: getIt(),
        clock: getIt(),
        logger: getIt(),
      ),
    )
    ..registerLazySingleton<FavoriteRepositoriesRepository>(
      () => FavoriteRepositoriesRepositoryImpl(
        local: getIt(),
        clock: getIt(),
        logger: getIt(),
      ),
    )
    ..registerLazySingleton(() => SearchRepositories(getIt()))
    ..registerLazySingleton(() => WatchFavorites(getIt()))
    ..registerLazySingleton(() => SetRepositoryFavorite(getIt()))
    ..registerFactory(() => SearchBloc(searchRepositories: getIt()))
    ..registerFactory(
      () => FavoritesBloc(
        watchFavorites: getIt(),
        setRepositoryFavorite: getIt(),
      ),
    );
}
