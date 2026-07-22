import 'package:bloc_test/bloc_test.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/core/result/result.dart';
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
}
