import 'package:github_repository_explorer/core/cache/cache_policy.dart';
import 'package:github_repository_explorer/core/error/app_exception.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/core/error/failure_mapper.dart';
import 'package:github_repository_explorer/core/logging/app_logger.dart';
import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/data_sources/repository_local_data_source.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/mappers/repository_mapper.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/repositories/favorite_repositories_repository.dart';

final class FavoriteRepositoriesRepositoryImpl
    implements FavoriteRepositoriesRepository {
  const FavoriteRepositoriesRepositoryImpl({
    required RepositoryLocalDataSource local,
    required Clock clock,
    required AppLogger logger,
  }) : _local = local,
       _clock = clock,
       _logger = logger;

  final RepositoryLocalDataSource _local;
  final Clock _clock;
  final AppLogger _logger;

  @override
  Stream<Result<List<GithubRepository>>> watchFavorites() async* {
    try {
      await for (final repositories in _local.watchFavorites()) {
        yield Result.success(
          repositories
              .map((repository) => repository.toDomain())
              .toList(growable: false),
        );
      }
    } on AppException catch (error) {
      yield Result.failure(mapExceptionToFailure(error));
    } on Exception catch (error, stackTrace) {
      _logger.error(
        'Unexpected failure while watching favorite repositories.',
        error: error,
        stackTrace: stackTrace,
      );
      yield const Result.failure(Failure.unexpected());
    }
  }

  @override
  Future<Result<void>> setFavorite(
    GithubRepository repository, {
    required bool isFavorite,
  }) async {
    try {
      final now = _clock.now();
      await _local.setFavorite(
        repositoryId: repository.id,
        repositorySnapshot: isFavorite ? repository.toCache() : null,
        isFavorite: isFavorite,
        changedAt: now,
      );
      return const Result.success(null);
    } on AppException catch (error) {
      return Result.failure(mapExceptionToFailure(error));
    } on Exception catch (error, stackTrace) {
      _logger.error(
        'Unexpected failure while updating a favorite repository.',
        error: error,
        stackTrace: stackTrace,
      );
      return const Result.failure(Failure.unexpected());
    }
  }
}
