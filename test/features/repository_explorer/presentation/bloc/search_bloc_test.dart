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
      bloc.add(const SearchEvent.retried());
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
}

RepositoryPage _page(GithubRepository repository) => RepositoryPage(
  repositories: <GithubRepository>[repository],
  page: 1,
  hasNextPage: false,
  origin: DataOrigin.network,
  fetchedAt: DateTime.utc(2026),
);
