import 'package:github_repository_explorer/core/cache/cache_policy.dart';
import 'package:github_repository_explorer/core/error/app_exception.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/data_sources/github_remote_data_source.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/data_sources/repository_local_data_source.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/database/cached_repository_model.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/dtos/github_search_response_dto.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/repositories/repository_search_repository_impl.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_page.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_search_request.dart';
import 'package:test/test.dart';

void main() {
  late _FakeClock clock;
  late _FakeLocalDataSource local;
  late _FakeRemoteDataSource remote;
  late RepositorySearchRepositoryImpl repository;

  setUp(() {
    clock = _FakeClock(DateTime.utc(2026, 7, 23, 12));
    local = _FakeLocalDataSource();
    remote = _FakeRemoteDataSource(
      (_, _, _) async => _remotePage,
    );
    repository = RepositorySearchRepositoryImpl(
      remote: remote,
      local: local,
      cachePolicy: const CachePolicy(),
      clock: clock,
    );
  });

  test('fresh cache satisfies a search without a remote request', () async {
    local.pages['flutter:1'] = _cachedPage(
      fetchedAt: clock.current.subtract(const Duration(minutes: 10)),
    );

    final results = await repository
        .search(const RepositorySearchRequest(query: 'flutter'))
        .toList();

    expect(results, hasLength(1));
    expect(
      results.single,
      isA<Success<RepositoryPage>>()
          .having((result) => result.data.origin, 'origin', DataOrigin.cache)
          .having((result) => result.data.isStale, 'isStale', isFalse),
    );
    expect(remote.calls, 0);
  });

  test('stale cache is emitted before a remote refresh', () async {
    local.pages['flutter:1'] = _cachedPage(
      fetchedAt: clock.current.subtract(const Duration(minutes: 16)),
    );

    final results = await repository
        .search(const RepositorySearchRequest(query: 'flutter'))
        .toList();

    expect(results, hasLength(2));
    expect(
      results.first,
      isA<Success<RepositoryPage>>().having(
        (result) => result.data.origin,
        'origin',
        DataOrigin.cache,
      ),
    );
    expect(
      results.last,
      isA<Success<RepositoryPage>>().having(
        (result) => result.data.origin,
        'origin',
        DataOrigin.network,
      ),
    );
    expect(remote.calls, 1);
  });

  test('force refresh bypasses a fresh cache', () async {
    local.pages['flutter:1'] = _cachedPage(
      fetchedAt: clock.current.subtract(const Duration(minutes: 10)),
    );

    final results = await repository
        .search(
          const RepositorySearchRequest(
            query: 'flutter',
            forceRefresh: true,
          ),
        )
        .toList();

    expect(results, hasLength(1));
    expect(
      results.single,
      isA<Success<RepositoryPage>>().having(
        (result) => result.data.origin,
        'origin',
        DataOrigin.network,
      ),
    );
    expect(remote.calls, 1);
  });

  test('rate limit blocks passive requests only until retryAt', () async {
    final retryAt = clock.current.add(const Duration(minutes: 1));
    remote.handler = (_, _, _) async {
      if (remote.calls == 1) {
        throw RateLimitException(retryAt: retryAt);
      }
      return _remotePage;
    };

    final first = await repository
        .search(const RepositorySearchRequest(query: 'flutter'))
        .single;
    final blocked = await repository
        .search(const RepositorySearchRequest(query: 'dart'))
        .single;

    expect(first, isA<FailureResult<RepositoryPage>>());
    expect(
      blocked,
      isA<FailureResult<RepositoryPage>>().having(
        (result) => result.failure,
        'failure',
        Failure.rateLimited(retryAt: retryAt),
      ),
    );
    expect(remote.calls, 1);

    clock.current = retryAt;
    final recovered = await repository
        .search(const RepositorySearchRequest(query: 'dart'))
        .single;

    expect(recovered, isA<Success<RepositoryPage>>());
    expect(remote.calls, 2);
  });

  test('rate limit keeps stale cache without another remote request', () async {
    final retryAt = clock.current.add(const Duration(minutes: 1));
    remote.handler = (_, _, _) async {
      throw RateLimitException(retryAt: retryAt);
    };
    await repository
        .search(const RepositorySearchRequest(query: 'initial'))
        .drain<void>();
    local.pages['flutter:1'] = _cachedPage(
      fetchedAt: clock.current.subtract(const Duration(minutes: 16)),
    );

    final results = await repository
        .search(const RepositorySearchRequest(query: 'flutter'))
        .toList();

    expect(results, hasLength(2));
    expect(
      results.last,
      isA<Success<RepositoryPage>>().having(
        (result) => result.data.refreshFailure,
        'refreshFailure',
        Failure.rateLimited(retryAt: retryAt),
      ),
    );
    expect(remote.calls, 1);
  });

  test('force refresh bypasses an active rate-limit guard', () async {
    final retryAt = clock.current.add(const Duration(minutes: 1));
    remote.handler = (_, _, _) async {
      if (remote.calls == 1) {
        throw RateLimitException(retryAt: retryAt);
      }
      return _remotePage;
    };
    await repository
        .search(const RepositorySearchRequest(query: 'flutter'))
        .drain<void>();

    final result = await repository
        .search(
          const RepositorySearchRequest(
            query: 'dart',
            forceRefresh: true,
          ),
        )
        .single;

    expect(result, isA<Success<RepositoryPage>>());
    expect(remote.calls, 2);
  });
}

final class _FakeClock implements Clock {
  _FakeClock(this.current);

  DateTime current;

  @override
  DateTime now() => current;
}

final class _FakeRemoteDataSource implements GithubRemoteDataSource {
  _FakeRemoteDataSource(this.handler);

  Future<RemoteRepositoryPage> Function(String, int, int) handler;
  int calls = 0;

  @override
  Future<RemoteRepositoryPage> search({
    required String query,
    required int page,
    required int pageSize,
  }) {
    calls++;
    return handler(query, page, pageSize);
  }
}

final class _FakeLocalDataSource implements RepositoryLocalDataSource {
  final Map<String, CachedRepositoryPage> pages = {};

  @override
  Future<CachedRepositoryPage?> readPage({
    required String query,
    required int page,
  }) async => pages['$query:$page'];

  @override
  Future<void> writePage({
    required String query,
    required CachedRepositoryPage page,
  }) async {
    pages['$query:${page.page}'] = page;
  }

  @override
  Future<void> prune({required DateTime olderThan}) async {}

  @override
  Future<void> setFavorite(
    CachedRepositoryModel repository, {
    required bool isFavorite,
    required DateTime changedAt,
  }) async {}

  @override
  Stream<List<CachedRepositoryModel>> watchFavorites() => const Stream.empty();
}

CachedRepositoryPage _cachedPage({required DateTime fetchedAt}) =>
    CachedRepositoryPage(
      repositories: [
        CachedRepositoryModel(
          id: 42,
          name: 'flutter',
          owner: 'flutter',
          description: 'Flutter framework',
          stars: 170000,
          forks: 28000,
          openIssues: 13000,
          language: 'Dart',
          githubUrl: 'https://github.com/flutter/flutter',
          updatedAt: fetchedAt,
        ),
      ],
      page: 1,
      hasNextPage: false,
      fetchedAt: fetchedAt,
    );

const _remotePage = RemoteRepositoryPage(
  repositories: [
    GithubRepositoryDto(
      id: 42,
      name: 'flutter',
      owner: GithubOwnerDto(login: 'flutter'),
      description: 'Flutter framework',
      stars: 170001,
      forks: 28000,
      openIssues: 13000,
      language: 'Dart',
      htmlUrl: 'https://github.com/flutter/flutter',
    ),
  ],
  hasNextPage: false,
);
