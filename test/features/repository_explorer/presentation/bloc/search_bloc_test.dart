import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_page.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_search_request.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/repositories/repository_search_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/use_cases/search_repositories.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/bloc/search/search_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../helpers/fixtures.dart';

final class _MockSearchRepository extends Mock
    implements RepositorySearchRepository {}

void main() {
  late _MockSearchRepository repository;

  setUpAll(() {
    registerFallbackValue(const RepositorySearchRequest(query: 'fallback'));
  });

  setUp(() {
    repository = _MockSearchRepository();
  });

  SearchBloc buildBloc() => SearchBloc(
    searchRepositories: SearchRepositories(repository),
  );

  blocTest<SearchBloc, SearchState>(
    'emits loading and success for a network result',
    setUp: () {
      when(() => repository.search(any())).thenAnswer(
        (_) => Stream.value(
          Result.success(
            RepositoryPage(
              repositories: [sampleRepository],
              page: 1,
              hasNextPage: false,
              origin: DataOrigin.network,
              fetchedAt: DateTime.utc(2026),
            ),
          ),
        ),
      );
    },
    build: buildBloc,
    act: (bloc) => bloc.add(const SearchEvent.submitted('flutter')),
    expect: () => [
      isA<SearchState>()
          .having((state) => state.status, 'status', SearchStatus.loading)
          .having((state) => state.query, 'query', 'flutter'),
      isA<SearchState>()
          .having((state) => state.status, 'status', SearchStatus.success)
          .having((state) => state.repositories, 'repositories', [
            sampleRepository,
          ])
          .having((state) => state.isFromCache, 'isFromCache', isFalse),
    ],
  );

  blocTest<SearchBloc, SearchState>(
    'emits loading and empty when no repositories match',
    setUp: () {
      when(() => repository.search(any())).thenAnswer(
        (_) => Stream.value(
          Result.success(
            RepositoryPage(
              repositories: const [],
              page: 1,
              hasNextPage: false,
              origin: DataOrigin.network,
              fetchedAt: DateTime.utc(2026),
            ),
          ),
        ),
      );
    },
    build: buildBloc,
    act: (bloc) => bloc.add(const SearchEvent.submitted('unlikely-query')),
    expect: () => [
      isA<SearchState>().having(
        (state) => state.status,
        'status',
        SearchStatus.loading,
      ),
      isA<SearchState>().having(
        (state) => state.status,
        'status',
        SearchStatus.empty,
      ),
    ],
  );

  blocTest<SearchBloc, SearchState>(
    'emits failure and retains the query so the request can be retried',
    setUp: () {
      when(() => repository.search(any())).thenAnswer(
        (_) => Stream.value(
          const Result.failure(Failure.network()),
        ),
      );
    },
    build: buildBloc,
    act: (bloc) => bloc.add(const SearchEvent.submitted('flutter')),
    expect: () => [
      isA<SearchState>().having(
        (state) => state.status,
        'status',
        SearchStatus.loading,
      ),
      isA<SearchState>()
          .having((state) => state.status, 'status', SearchStatus.failure)
          .having((state) => state.query, 'query', 'flutter')
          .having((state) => state.failure, 'failure', isA<NetworkFailure>()),
    ],
  );

  blocTest<SearchBloc, SearchState>(
    'retries the failed first page and recovers',
    setUp: () {
      var attempt = 0;
      when(() => repository.search(any())).thenAnswer((_) {
        attempt++;
        if (attempt == 1) {
          return Stream.value(const Result.failure(Failure.network()));
        }
        return Stream.value(
          Result.success(
            RepositoryPage(
              repositories: [sampleRepository],
              page: 1,
              hasNextPage: false,
              origin: DataOrigin.network,
              fetchedAt: DateTime.utc(2026),
            ),
          ),
        );
      });
    },
    build: buildBloc,
    act: (bloc) async {
      bloc.add(const SearchEvent.submitted('flutter'));
      await bloc.stream.firstWhere(
        (state) => state.status == SearchStatus.failure,
      );
      bloc.add(const SearchEvent.retryPage(1));
    },
    expect: () => [
      isA<SearchState>().having(
        (state) => state.status,
        'status',
        SearchStatus.loading,
      ),
      isA<SearchState>().having(
        (state) => state.status,
        'status',
        SearchStatus.failure,
      ),
      isA<SearchState>().having(
        (state) => state.status,
        'status',
        SearchStatus.loading,
      ),
      isA<SearchState>()
          .having((state) => state.status, 'status', SearchStatus.success)
          .having((state) => state.repositories, 'repositories', [
            sampleRepository,
          ]),
    ],
  );

  blocTest<SearchBloc, SearchState>(
    'shows cached content before replacing it with fresh network content',
    setUp: () {
      when(() => repository.search(any())).thenAnswer(
        (_) => Stream.fromIterable([
          Result.success(
            RepositoryPage(
              repositories: [sampleRepository],
              page: 1,
              hasNextPage: true,
              origin: DataOrigin.cache,
              fetchedAt: DateTime.utc(2026),
              isStale: true,
            ),
          ),
          Result.success(
            RepositoryPage(
              repositories: [sampleRepository.copyWith(stars: 170001)],
              page: 1,
              hasNextPage: false,
              origin: DataOrigin.network,
              fetchedAt: DateTime.utc(2026, 1, 1, 0, 1),
            ),
          ),
        ]),
      );
    },
    build: buildBloc,
    act: (bloc) => bloc.add(const SearchEvent.submitted('flutter')),
    expect: () => [
      isA<SearchState>().having(
        (state) => state.status,
        'status',
        SearchStatus.loading,
      ),
      isA<SearchState>()
          .having((state) => state.isFromCache, 'isFromCache', isTrue)
          .having((state) => state.isStale, 'isStale', isTrue),
      isA<SearchState>()
          .having((state) => state.isFromCache, 'isFromCache', isFalse)
          .having(
            (state) => state.repositories.single.stars,
            'updated stars',
            170001,
          ),
    ],
  );

  test(
    'replaces a stale cached page without retaining removed items',
    () async {
      final firstPageRepository = sampleRepository.copyWith(
        id: 1,
        name: 'first',
      );
      final staleA = sampleRepository.copyWith(id: 2, name: 'stale-a');
      final staleB = sampleRepository.copyWith(id: 3, name: 'stale-b');
      final freshB = staleB.copyWith(name: 'fresh-b', stars: 200);
      final freshC = sampleRepository.copyWith(id: 4, name: 'fresh-c');
      when(() => repository.search(any())).thenAnswer((invocation) {
        final request =
            invocation.positionalArguments.single as RepositorySearchRequest;
        if (request.page == 1) {
          return Stream.value(
            Result.success(
              _repositoryPage(
                repositories: [firstPageRepository],
                page: 1,
                hasNextPage: true,
              ),
            ),
          );
        }
        return Stream.fromIterable([
          Result.success(
            _repositoryPage(
              repositories: [staleA, staleB],
              page: 2,
              hasNextPage: true,
              origin: DataOrigin.cache,
              isStale: true,
            ),
          ),
          Result.success(
            _repositoryPage(
              repositories: [freshB, freshC],
              page: 2,
              hasNextPage: false,
            ),
          ),
        ]);
      });
      final bloc = buildBloc()..add(const SearchEvent.submitted('flutter'));
      await bloc.stream.firstWhere((state) => state.currentPage == 1);

      bloc.add(const SearchEvent.loadNextPage());
      await bloc.stream.firstWhere(
        (state) => state.pages[2]?.origin == DataOrigin.network,
      );

      expect(
        bloc.state.repositories.map((repository) => repository.name),
        ['first', 'fresh-b', 'fresh-c'],
      );
      expect(bloc.state.repositories, isNot(contains(staleA)));
      expect(bloc.state.hasReachedEnd, isTrue);
      await bloc.close();
    },
  );

  test('a later page success keeps the first page cache warning', () async {
    const refreshFailure = Failure.network();
    when(() => repository.search(any())).thenAnswer((invocation) {
      final request =
          invocation.positionalArguments.single as RepositorySearchRequest;
      if (request.page == 1) {
        return Stream.value(
          Result.success(
            _repositoryPage(
              repositories: [sampleRepository],
              page: 1,
              hasNextPage: true,
              origin: DataOrigin.cache,
              isStale: true,
              fetchedAt: DateTime.utc(2025),
              refreshFailure: refreshFailure,
            ),
          ),
        );
      }
      return Stream.value(
        Result.success(
          _repositoryPage(
            repositories: [
              sampleRepository.copyWith(id: 43, name: 'second'),
            ],
            page: 2,
            hasNextPage: false,
            fetchedAt: DateTime.utc(2026),
          ),
        ),
      );
    });
    final bloc = buildBloc()..add(const SearchEvent.submitted('flutter'));
    await bloc.stream.firstWhere((state) => state.currentPage == 1);

    bloc.add(const SearchEvent.loadNextPage());
    await bloc.stream.firstWhere((state) => state.currentPage == 2);

    expect(bloc.state.isFromCache, isTrue);
    expect(bloc.state.isStale, isTrue);
    expect(bloc.state.fetchedAt, DateTime.utc(2025));
    expect(bloc.state.refreshFailure, refreshFailure);
    await bloc.close();
  });

  test('a cached page revalidation failure is retried as pagination', () async {
    var pageTwoAttempts = 0;
    when(() => repository.search(any())).thenAnswer((invocation) {
      final request =
          invocation.positionalArguments.single as RepositorySearchRequest;
      if (request.page == 1) {
        return Stream.value(
          Result.success(
            _repositoryPage(
              repositories: [sampleRepository],
              page: 1,
              hasNextPage: true,
            ),
          ),
        );
      }
      pageTwoAttempts++;
      return Stream.value(
        Result.success(
          _repositoryPage(
            repositories: [
              sampleRepository.copyWith(id: 43, name: 'second'),
            ],
            page: 2,
            hasNextPage: false,
            origin: pageTwoAttempts == 1
                ? DataOrigin.cache
                : DataOrigin.network,
            refreshFailure: pageTwoAttempts == 1
                ? const Failure.network()
                : null,
          ),
        ),
      );
    });
    final bloc = buildBloc()..add(const SearchEvent.submitted('flutter'));
    await bloc.stream.firstWhere((state) => state.currentPage == 1);
    bloc.add(const SearchEvent.loadNextPage());
    await bloc.stream.firstWhere(
      (state) => state.paginationFailurePage == 2,
    );

    bloc.add(const SearchEvent.retryPage(2));
    await bloc.stream.firstWhere(
      (state) =>
          state.pages[2]?.origin == DataOrigin.network &&
          state.paginationFailure == null,
    );

    final pageTwoRequests =
        verify(
          () => repository.search(captureAny()),
        ).captured.cast<RepositorySearchRequest>().where(
          (request) => request.page == 2,
        );
    expect(pageTwoRequests, hasLength(2));
    expect(pageTwoRequests.last.forceRefresh, isTrue);
    await bloc.close();
  });

  test('failed pull-to-refresh preserves already loaded later pages', () async {
    var firstPageAttempts = 0;
    final secondPageRepository = sampleRepository.copyWith(
      id: 43,
      name: 'second',
    );
    when(() => repository.search(any())).thenAnswer((invocation) {
      final request =
          invocation.positionalArguments.single as RepositorySearchRequest;
      if (request.page == 2) {
        return Stream.value(
          Result.success(
            _repositoryPage(
              repositories: [secondPageRepository],
              page: 2,
              hasNextPage: false,
            ),
          ),
        );
      }
      firstPageAttempts++;
      return Stream.value(
        Result.success(
          _repositoryPage(
            repositories: [sampleRepository],
            page: 1,
            hasNextPage: true,
            origin: firstPageAttempts == 1
                ? DataOrigin.network
                : DataOrigin.cache,
            refreshFailure: firstPageAttempts == 1
                ? null
                : const Failure.network(),
          ),
        ),
      );
    });
    final bloc = buildBloc()..add(const SearchEvent.submitted('flutter'));
    await bloc.stream.firstWhere((state) => state.currentPage == 1);
    bloc.add(const SearchEvent.loadNextPage());
    await bloc.stream.firstWhere((state) => state.currentPage == 2);

    bloc.add(const SearchEvent.refreshed());
    await bloc.stream.firstWhere(
      (state) => !state.isRefreshing && state.refreshFailure != null,
    );

    expect(
      bloc.state.repositories,
      [sampleRepository, secondPageRepository],
    );
    expect(bloc.state.currentPage, 2);
    await bloc.close();
  });

  test('a successful page refresh invalidates all later pages', () async {
    var firstPageAttempts = 0;
    final refreshedRepository = sampleRepository.copyWith(
      name: 'refreshed',
      stars: 200,
    );
    when(() => repository.search(any())).thenAnswer((invocation) {
      final request =
          invocation.positionalArguments.single as RepositorySearchRequest;
      if (request.page == 2) {
        return Stream.value(
          Result.success(
            _repositoryPage(
              repositories: [
                sampleRepository.copyWith(id: 43, name: 'second'),
              ],
              page: 2,
              hasNextPage: false,
            ),
          ),
        );
      }
      firstPageAttempts++;
      return Stream.value(
        Result.success(
          _repositoryPage(
            repositories: [
              if (firstPageAttempts == 1)
                sampleRepository
              else
                refreshedRepository,
            ],
            page: 1,
            hasNextPage: true,
          ),
        ),
      );
    });
    final bloc = buildBloc()..add(const SearchEvent.submitted('flutter'));
    await bloc.stream.firstWhere((state) => state.currentPage == 1);
    bloc.add(const SearchEvent.loadNextPage());
    await bloc.stream.firstWhere((state) => state.currentPage == 2);

    bloc.add(const SearchEvent.refreshed());
    await bloc.stream.firstWhere(
      (state) =>
          !state.isRefreshing &&
          state.repositories.length == 1 &&
          state.repositories.single.name == 'refreshed',
    );

    expect(bloc.state.pages.keys, [1]);
    expect(bloc.state.currentPage, 1);
    await bloc.close();
  });

  test('a successful refresh clears failures for invalidated pages', () async {
    var firstPageAttempts = 0;
    final refreshedRepository = sampleRepository.copyWith(name: 'refreshed');
    when(() => repository.search(any())).thenAnswer((invocation) {
      final request =
          invocation.positionalArguments.single as RepositorySearchRequest;
      if (request.page == 2) {
        return Stream.value(
          Result.success(
            _repositoryPage(
              repositories: [
                sampleRepository.copyWith(id: 43, name: 'second'),
              ],
              page: 2,
              hasNextPage: true,
            ),
          ),
        );
      }
      if (request.page == 3) {
        return Stream.value(const Result.failure(Failure.network()));
      }
      firstPageAttempts++;
      return Stream.value(
        Result.success(
          _repositoryPage(
            repositories: [
              if (firstPageAttempts == 1)
                sampleRepository
              else
                refreshedRepository,
            ],
            page: 1,
            hasNextPage: firstPageAttempts == 1,
          ),
        ),
      );
    });
    final bloc = buildBloc()..add(const SearchEvent.submitted('flutter'));
    await bloc.stream
        .firstWhere((state) => state.currentPage == 1)
        .timeout(
          const Duration(seconds: 2),
          onTimeout: () => throw StateError('Page 1: ${bloc.state}'),
        );
    bloc.add(const SearchEvent.loadNextPage());
    await bloc.stream
        .firstWhere((state) => state.currentPage == 2)
        .timeout(
          const Duration(seconds: 2),
          onTimeout: () => throw StateError('Page 2: ${bloc.state}'),
        );
    await Future<void>.delayed(Duration.zero);
    bloc.add(const SearchEvent.loadNextPage());
    await bloc.stream
        .firstWhere((state) => state.paginationFailurePage == 3)
        .timeout(
          const Duration(seconds: 2),
          onTimeout: () => throw StateError('Page 3 failure: ${bloc.state}'),
        );

    bloc.add(const SearchEvent.refreshed());
    await bloc.stream
        .firstWhere(
          (state) =>
              !state.isRefreshing &&
              state.repositories.length == 1 &&
              state.repositories.single.name == 'refreshed',
        )
        .timeout(
          const Duration(seconds: 2),
          onTimeout: () => throw StateError('Refresh: ${bloc.state}'),
        );

    expect(bloc.state.pages.keys, [1]);
    expect(bloc.state.pageFailure, isNull);
    expect(bloc.state.paginationFailure, isNull);
    expect(bloc.state.hasReachedEnd, isTrue);
    await bloc.close();
  });

  blocTest<SearchBloc, SearchState>(
    'submit cancels a pending passive search for the normalized query',
    setUp: () {
      when(() => repository.search(any())).thenAnswer(
        (_) => Stream.value(Result.success(_page(sampleRepository))),
      );
    },
    build: buildBloc,
    act: (bloc) {
      bloc
        ..add(const SearchEvent.queryChanged('  flutter   bloc  '))
        ..add(const SearchEvent.submitted('flutter bloc'));
    },
    wait: const Duration(milliseconds: 550),
    expect: () => [
      isA<SearchState>().having(
        (state) => state.status,
        'status',
        SearchStatus.loading,
      ),
      isA<SearchState>().having(
        (state) => state.status,
        'status',
        SearchStatus.success,
      ),
    ],
    verify: (_) {
      final requests = verify(
        () => repository.search(captureAny()),
      ).captured.cast<RepositorySearchRequest>();
      expect(requests, hasLength(1));
      expect(requests.single.query, 'flutter bloc');
    },
  );

  test('submit starts without waiting for the typing debounce', () async {
    final called = Completer<void>();
    when(() => repository.search(any())).thenAnswer((_) {
      called.complete();
      return Stream.value(Result.success(_page(sampleRepository)));
    });
    final bloc = buildBloc()..add(const SearchEvent.submitted('flutter'));

    await called.future.timeout(const Duration(milliseconds: 200));
    verify(() => repository.search(any())).called(1);
    await bloc.close();
  });

  test('submit does not duplicate an in-flight passive search', () async {
    final results = StreamController<Result<RepositoryPage>>();
    final called = Completer<void>();
    when(() => repository.search(any())).thenAnswer((_) {
      if (!called.isCompleted) {
        called.complete();
      }
      return results.stream;
    });
    final bloc = buildBloc()
      ..add(const SearchEvent.queryChanged('  flutter   bloc  '));

    await called.future.timeout(const Duration(seconds: 1));
    bloc.add(const SearchEvent.submitted('flutter bloc'));
    await Future<void>.delayed(const Duration(milliseconds: 50));

    final requests = verify(
      () => repository.search(captureAny()),
    ).captured.cast<RepositorySearchRequest>();
    expect(requests, hasLength(1));
    expect(requests.single.query, 'flutter bloc');

    results.add(Result.success(_page(sampleRepository)));
    await bloc.stream.firstWhere(
      (state) => state.status == SearchStatus.success,
    );

    await results.close();
    await bloc.close();
  });

  blocTest<SearchBloc, SearchState>(
    'only searches the last of several rapidly typed queries',
    setUp: () {
      when(() => repository.search(any())).thenAnswer(
        (_) => Stream.value(Result.success(_page(sampleRepository))),
      );
    },
    build: buildBloc,
    act: (bloc) {
      bloc
        ..add(const SearchEvent.queryChanged('fl'))
        ..add(const SearchEvent.queryChanged('flutter'))
        ..add(const SearchEvent.queryChanged('  flutter   bloc  '));
    },
    wait: const Duration(milliseconds: 550),
    expect: () => [
      isA<SearchState>().having(
        (state) => state.status,
        'status',
        SearchStatus.loading,
      ),
      isA<SearchState>().having(
        (state) => state.status,
        'status',
        SearchStatus.success,
      ),
    ],
    verify: (_) {
      final requests = verify(
        () => repository.search(captureAny()),
      ).captured.cast<RepositorySearchRequest>();
      expect(requests, hasLength(1));
      expect(requests.single.query, 'flutter bloc');
    },
  );

  test('a different submitted query replaces the previous search', () async {
    final flutterResults = StreamController<Result<RepositoryPage>>();
    final dartResults = StreamController<Result<RepositoryPage>>();
    final flutterCalled = Completer<void>();
    final dartCalled = Completer<void>();
    when(() => repository.search(any())).thenAnswer((invocation) {
      final request =
          invocation.positionalArguments.single as RepositorySearchRequest;
      if (request.query == 'flutter') {
        flutterCalled.complete();
        return flutterResults.stream;
      }
      if (request.query == 'dart') {
        dartCalled.complete();
        return dartResults.stream;
      }
      throw StateError('Unexpected query: ${request.query}');
    });
    final bloc = buildBloc()..add(const SearchEvent.submitted('  flutter  '));
    await flutterCalled.future;
    bloc.add(const SearchEvent.submitted('dart'));
    await dartCalled.future;

    final dartRepository = sampleRepository.copyWith(id: 43, name: 'dart');
    final dartSuccess = bloc.stream.firstWhere(
      (state) => state.status == SearchStatus.success && state.query == 'dart',
    );
    dartResults.add(Result.success(_page(dartRepository)));
    await dartSuccess;
    flutterResults.add(Result.success(_page(sampleRepository)));
    await Future<void>.delayed(Duration.zero);

    expect(bloc.state.query, 'dart');
    expect(bloc.state.repositories, <GithubRepository>[dartRepository]);
    verify(() => repository.search(any())).called(2);

    await flutterResults.close();
    await dartResults.close();
    await bloc.close();
  });

  test('a different query cancels the active repository stream', () async {
    final firstCancelled = Completer<void>();
    final firstCalled = Completer<void>();
    final firstResults = StreamController<Result<RepositoryPage>>(
      onCancel: () {
        firstCancelled.complete();
      },
    );
    when(() => repository.search(any())).thenAnswer((invocation) {
      final request =
          invocation.positionalArguments.single as RepositorySearchRequest;
      if (request.query == 'flutter') {
        firstCalled.complete();
        return firstResults.stream;
      }
      return Stream.value(
        Result.success(
          _page(sampleRepository.copyWith(id: 43, name: 'dart')),
        ),
      );
    });
    final bloc = buildBloc()..add(const SearchEvent.submitted('flutter'));
    await firstCalled.future;

    bloc.add(const SearchEvent.submitted('dart'));
    await firstCancelled.future;
    await bloc.stream.firstWhere(
      (state) => state.status == SearchStatus.success && state.query == 'dart',
    );

    expect(bloc.state.repositories.single.name, 'dart');
    await firstResults.close();
    await bloc.close();
  });

  test('an invalid query cancels the active repository stream', () async {
    final searchCancelled = Completer<void>();
    final searchCalled = Completer<void>();
    final results = StreamController<Result<RepositoryPage>>(
      onCancel: searchCancelled.complete,
    );
    when(() => repository.search(any())).thenAnswer((_) {
      searchCalled.complete();
      return results.stream;
    });
    final bloc = buildBloc()..add(const SearchEvent.submitted('flutter'));
    await searchCalled.future;

    bloc.add(const SearchEvent.queryChanged(' '));
    await searchCancelled.future.timeout(const Duration(seconds: 2));
    await bloc.stream.firstWhere(
      (state) =>
          state.status == SearchStatus.initial &&
          state.query.isEmpty &&
          state.pages.isEmpty,
    );

    verify(() => repository.search(any())).called(1);
    await results.close();
    await bloc.close();
  });
}

RepositoryPage _page(GithubRepository repository) => RepositoryPage(
  repositories: <GithubRepository>[repository],
  page: 1,
  hasNextPage: false,
  origin: DataOrigin.network,
  fetchedAt: DateTime.utc(2026),
);

RepositoryPage _repositoryPage({
  required List<GithubRepository> repositories,
  required int page,
  required bool hasNextPage,
  DataOrigin origin = DataOrigin.network,
  DateTime? fetchedAt,
  bool isStale = false,
  Failure? refreshFailure,
}) => RepositoryPage(
  repositories: repositories,
  page: page,
  hasNextPage: hasNextPage,
  origin: origin,
  fetchedAt: fetchedAt ?? DateTime.utc(2026),
  isStale: isStale,
  refreshFailure: refreshFailure,
);
