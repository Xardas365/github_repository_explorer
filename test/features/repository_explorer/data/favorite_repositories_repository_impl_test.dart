import 'package:github_repository_explorer/core/cache/cache_policy.dart';
import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/data_sources/repository_local_data_source.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/database/cached_repository_model.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/repositories/favorite_repositories_repository_impl.dart';
import 'package:test/test.dart';

import '../../../helpers/fixtures.dart';
import '../../../helpers/test_logger.dart';

void main() {
  test('uses the snapshot observation time when adding a favorite', () async {
    final observedAt = DateTime.utc(2026, 1, 1);
    final changedAt = DateTime.utc(2026, 1, 3);
    final local = _RecordingLocalDataSource();
    final repository = FavoriteRepositoriesRepositoryImpl(
      local: local,
      clock: _FixedClock(changedAt),
      logger: RecordingAppLogger(),
    );

    final result = await repository.setFavorite(
      sampleRepository.copyWith(observedAt: observedAt),
      isFavorite: true,
    );

    expect(result, const Result<void>.success(null));
    expect(local.repositorySnapshot?.updatedAt, observedAt);
    expect(local.changedAt, changedAt);
  });
}

final class _FixedClock implements Clock {
  const _FixedClock(this.value);

  final DateTime value;

  @override
  DateTime now() => value;
}

final class _RecordingLocalDataSource implements RepositoryLocalDataSource {
  CachedRepositoryModel? repositorySnapshot;
  DateTime? changedAt;

  @override
  Future<void> setFavorite({
    required int repositoryId,
    required bool isFavorite,
    required DateTime changedAt,
    CachedRepositoryModel? repositorySnapshot,
  }) async {
    this.repositorySnapshot = repositorySnapshot;
    this.changedAt = changedAt;
  }

  @override
  Future<CachedRepositoryPage?> readPage({
    required String query,
    required int page,
  }) async => null;

  @override
  Future<void> writePage({
    required String query,
    required CachedRepositoryPage page,
  }) async {}

  @override
  Stream<List<CachedRepositoryModel>> watchFavorites() => const Stream.empty();

  @override
  Future<void> prune({required DateTime olderThan}) async {}
}
