import 'package:drift/drift.dart';
import 'package:github_repository_explorer/core/error/app_exception.dart';
import 'package:github_repository_explorer/core/logging/app_logger.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/database/app_database.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/database/cached_repository_model.dart';

abstract interface class RepositoryLocalDataSource {
  Future<CachedRepositoryPage?> readPage({
    required String query,
    required int page,
  });

  Future<void> writePage({
    required String query,
    required CachedRepositoryPage page,
  });

  Stream<List<CachedRepositoryModel>> watchFavorites();

  Future<void> setFavorite({
    required int repositoryId,
    required bool isFavorite,
    required DateTime changedAt,
    CachedRepositoryModel? repositorySnapshot,
  });

  Future<void> prune({required DateTime olderThan});
}

final class DriftRepositoryLocalDataSource
    implements RepositoryLocalDataSource {
  const DriftRepositoryLocalDataSource(
    this._database, {
    required AppLogger logger,
  }) : _logger = logger;

  final AppDatabase _database;
  final AppLogger _logger;

  @override
  Future<CachedRepositoryPage?> readPage({
    required String query,
    required int page,
  }) async {
    try {
      final pageQuery = _database.select(_database.searchPages)
        ..where((row) => row.query.equals(query) & row.page.equals(page));
      final metadata = await pageQuery.getSingleOrNull();
      if (metadata == null) return null;

      final joined =
          _database.select(_database.searchPageItems).join([
              innerJoin(
                _database.cachedRepositories,
                _database.cachedRepositories.id.equalsExp(
                  _database.searchPageItems.repositoryId,
                ),
              ),
            ])
            ..where(
              _database.searchPageItems.query.equals(query) &
                  _database.searchPageItems.page.equals(page),
            )
            ..orderBy([
              OrderingTerm.asc(_database.searchPageItems.position),
            ]);
      final rows = await joined.get();
      return CachedRepositoryPage(
        repositories: rows
            .map(
              (row) => _toModel(
                row.readTable(_database.cachedRepositories),
              ),
            )
            .toList(growable: false),
        page: metadata.page,
        hasNextPage: metadata.hasNextPage,
        fetchedAt: metadata.fetchedAt,
      );
    } on Exception catch (error, stackTrace) {
      _logger.error(
        'Could not read cached repositories.',
        error: error,
        stackTrace: stackTrace,
      );
      throw const CacheException();
    }
  }

  @override
  Future<void> writePage({
    required String query,
    required CachedRepositoryPage page,
  }) async {
    try {
      await _database.transaction(() async {
        await _database.batch((batch) {
          batch.insertAllOnConflictUpdate(
            _database.cachedRepositories,
            page.repositories.map(_toCompanion).toList(growable: false),
          );
        });
        await (_database.delete(_database.searchPageItems)..where(
              (row) => row.query.equals(query) & row.page.equals(page.page),
            ))
            .go();
        await _database
            .into(_database.searchPages)
            .insertOnConflictUpdate(
              SearchPagesCompanion.insert(
                query: query,
                page: page.page,
                hasNextPage: page.hasNextPage,
                fetchedAt: page.fetchedAt,
              ),
            );
        await _database.batch((batch) {
          batch.insertAll(
            _database.searchPageItems,
            [
              for (final entry in page.repositories.indexed)
                SearchPageItemsCompanion.insert(
                  query: query,
                  page: page.page,
                  repositoryId: entry.$2.id,
                  position: entry.$1,
                ),
            ],
          );
        });
      });
    } on Exception catch (error, stackTrace) {
      _logger.error(
        'Could not cache repositories.',
        error: error,
        stackTrace: stackTrace,
      );
      throw const CacheException();
    }
  }

  @override
  Stream<List<CachedRepositoryModel>> watchFavorites() async* {
    try {
      final query =
          _database.select(_database.favoriteRepositories).join([
            innerJoin(
              _database.cachedRepositories,
              _database.cachedRepositories.id.equalsExp(
                _database.favoriteRepositories.repositoryId,
              ),
            ),
          ])..orderBy([
            OrderingTerm.desc(_database.favoriteRepositories.favoritedAt),
          ]);
      await for (final rows in query.watch()) {
        yield rows
            .map(
              (row) => _toModel(
                row.readTable(_database.cachedRepositories),
              ),
            )
            .toList(growable: false);
      }
    } on Exception catch (error, stackTrace) {
      _logger.error(
        'Could not watch favorite repositories.',
        error: error,
        stackTrace: stackTrace,
      );
      throw const CacheException();
    }
  }

  @override
  Future<void> setFavorite({
    required int repositoryId,
    required bool isFavorite,
    required DateTime changedAt,
    CachedRepositoryModel? repositorySnapshot,
  }) async {
    try {
      await _database.transaction(() async {
        if (isFavorite) {
          final snapshot = repositorySnapshot;
          if (snapshot != null) {
            final existing =
                await (_database.select(_database.cachedRepositories)..where(
                      (row) => row.id.equals(repositoryId),
                    ))
                    .getSingleOrNull();
            if (existing == null ||
                snapshot.updatedAt.isAfter(existing.updatedAt)) {
              await _database
                  .into(_database.cachedRepositories)
                  .insertOnConflictUpdate(_toCompanion(snapshot));
            }
          }
          await _database
              .into(_database.favoriteRepositories)
              .insertOnConflictUpdate(
                FavoriteRepositoriesCompanion.insert(
                  repositoryId: Value(repositoryId),
                  favoritedAt: changedAt.toUtc(),
                ),
              );
        } else {
          await (_database.delete(
            _database.favoriteRepositories,
          )..where((row) => row.repositoryId.equals(repositoryId))).go();
        }
      });
    } on Exception catch (error, stackTrace) {
      _logger.error(
        'Could not update favorite.',
        error: error,
        stackTrace: stackTrace,
      );
      throw const CacheException();
    }
  }

  @override
  Future<void> prune({required DateTime olderThan}) async {
    try {
      await _database.transaction(() async {
        final expiredPage = _database.selectOnly(_database.searchPages)
          ..addColumns([_database.searchPages.query])
          ..where(
            _database.searchPages.query.equalsExp(
                  _database.searchPageItems.query,
                ) &
                _database.searchPages.page.equalsExp(
                  _database.searchPageItems.page,
                ) &
                _database.searchPages.fetchedAt.isSmallerThanValue(olderThan),
          );
        await (_database.delete(
          _database.searchPageItems,
        )..where((_) => existsQuery(expiredPage))).go();
        await (_database.delete(_database.searchPages)..where(
              (row) => row.fetchedAt.isSmallerThanValue(olderThan),
            ))
            .go();

        final pageReference = _database.selectOnly(_database.searchPageItems)
          ..addColumns([_database.searchPageItems.repositoryId])
          ..where(
            _database.searchPageItems.repositoryId.equalsExp(
              _database.cachedRepositories.id,
            ),
          );
        final favoriteReference =
            _database.selectOnly(_database.favoriteRepositories)
              ..addColumns([_database.favoriteRepositories.repositoryId])
              ..where(
                _database.favoriteRepositories.repositoryId.equalsExp(
                  _database.cachedRepositories.id,
                ),
              );
        await (_database.delete(_database.cachedRepositories)..where(
              (_) =>
                  notExistsQuery(pageReference) &
                  notExistsQuery(favoriteReference),
            ))
            .go();
      });
    } on Exception catch (error, stackTrace) {
      _logger.error(
        'Could not prune repository cache.',
        error: error,
        stackTrace: stackTrace,
      );
      throw const CacheException();
    }
  }

  CachedRepositoryModel _toModel(CachedRepository row) => CachedRepositoryModel(
    id: row.id,
    name: row.name,
    owner: row.owner,
    description: row.description,
    stars: row.stars,
    forks: row.forks,
    openIssues: row.openIssues,
    language: row.language,
    githubUrl: row.githubUrl,
    updatedAt: row.updatedAt,
  );

  CachedRepositoriesCompanion _toCompanion(CachedRepositoryModel model) =>
      CachedRepositoriesCompanion.insert(
        id: Value(model.id),
        name: model.name,
        owner: model.owner,
        description: model.description,
        stars: model.stars,
        forks: model.forks,
        openIssues: model.openIssues,
        language: Value(model.language),
        githubUrl: model.githubUrl,
        updatedAt: model.updatedAt,
      );
}
