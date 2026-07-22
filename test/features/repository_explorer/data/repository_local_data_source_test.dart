import 'package:drift/native.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/data_sources/repository_local_data_source.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/database/app_database.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/database/cached_repository_model.dart';
import 'package:test/test.dart';

void main() {
  late AppDatabase database;
  late DriftRepositoryLocalDataSource local;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    local = DriftRepositoryLocalDataSource(database);
  });

  tearDown(() => database.close());

  group('DriftRepositoryLocalDataSource.prune', () {
    test('removes an expired unreferenced repository', () async {
      final repository = _repository(1);
      await _writePage(
        local,
        query: 'expired',
        repository: repository,
        fetchedAt: DateTime.utc(2026),
      );

      await local.prune(olderThan: DateTime.utc(2026, 1, 2));

      expect(await local.readPage(query: 'expired', page: 1), isNull);
      expect(await _isCached(database, repository.id), isFalse);
    });

    test('keeps a repository referenced by a non-expired page', () async {
      final repository = _repository(2);
      await _writePage(
        local,
        query: 'current',
        repository: repository,
        fetchedAt: DateTime.utc(2026, 1, 3),
      );

      await local.prune(olderThan: DateTime.utc(2026, 1, 2));

      expect(await local.readPage(query: 'current', page: 1), isNotNull);
      expect(await _isCached(database, repository.id), isTrue);
    });

    test('keeps a favorite after its cached page expires', () async {
      final repository = _repository(3);
      await _writePage(
        local,
        query: 'favorite',
        repository: repository,
        fetchedAt: DateTime.utc(2026),
      );
      await local.setFavorite(
        repository,
        isFavorite: true,
        changedAt: DateTime.utc(2026, 1, 2),
      );

      await local.prune(olderThan: DateTime.utc(2026, 1, 2));

      expect(await local.readPage(query: 'favorite', page: 1), isNull);
      expect(await _isCached(database, repository.id), isTrue);
      expect(
        (await local.watchFavorites().first).map((item) => item.id),
        <int>[repository.id],
      );
    });

    test('removes a repository no longer favorited or on any page', () async {
      final repository = _repository(4);
      await _writePage(
        local,
        query: 'former-favorite',
        repository: repository,
        fetchedAt: DateTime.utc(2026),
      );
      await local.setFavorite(
        repository,
        isFavorite: true,
        changedAt: DateTime.utc(2026, 1, 2),
      );
      await local.prune(olderThan: DateTime.utc(2026, 1, 2));
      await local.setFavorite(
        repository,
        isFavorite: false,
        changedAt: DateTime.utc(2026, 1, 3),
      );

      await local.prune(olderThan: DateTime.utc(2026, 1, 2));

      expect(await _isCached(database, repository.id), isFalse);
      expect(await local.watchFavorites().first, isEmpty);
    });
  });
}

Future<void> _writePage(
  DriftRepositoryLocalDataSource local, {
  required String query,
  required CachedRepositoryModel repository,
  required DateTime fetchedAt,
}) => local.writePage(
  query: query,
  page: CachedRepositoryPage(
    repositories: <CachedRepositoryModel>[repository],
    page: 1,
    hasNextPage: false,
    fetchedAt: fetchedAt,
  ),
);

CachedRepositoryModel _repository(int id) => CachedRepositoryModel(
  id: id,
  name: 'repository-$id',
  owner: 'owner',
  description: 'Description',
  stars: 10,
  forks: 2,
  openIssues: 1,
  language: 'Dart',
  githubUrl: 'https://github.com/owner/repository-$id',
  updatedAt: DateTime.utc(2026),
);

Future<bool> _isCached(AppDatabase database, int id) async {
  final query = database.select(database.cachedRepositories)
    ..where((row) => row.id.equals(id));
  return await query.getSingleOrNull() != null;
}
