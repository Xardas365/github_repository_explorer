import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_page.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_search_request.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/repositories/favorite_repositories_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/repositories/repository_search_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/use_cases/search_repositories.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/use_cases/set_repository_favorite.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/use_cases/watch_favorites.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/bloc/search/search_bloc.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/pages/search_page.dart';

final class _UnusedSearchRepository implements RepositorySearchRepository {
  @override
  Stream<Result<RepositoryPage>> search(RepositorySearchRequest request) =>
      const Stream.empty();
}

final class _FakeFavoritesRepository implements FavoriteRepositoriesRepository {
  @override
  Future<Result<void>> setFavorite(
    GithubRepository repository, {
    required bool isFavorite,
  }) async => const Result.success(null);

  @override
  Stream<Result<List<GithubRepository>>> watchFavorites() =>
      const Stream.empty();
}

void main() {
  testWidgets('resets the result scroll position for a new normalized query', (
    tester,
  ) async {
    final searchBloc = SearchBloc(
      searchRepositories: SearchRepositories(_UnusedSearchRepository()),
    );
    final favoritesRepository = _FakeFavoritesRepository();
    final favoritesBloc = FavoritesBloc(
      watchFavorites: WatchFavorites(favoritesRepository),
      setRepositoryFavorite: SetRepositoryFavorite(favoritesRepository),
    );

    await tester.pumpWidget(
      _TestApp(
        searchBloc: searchBloc,
        favoritesBloc: favoritesBloc,
        state: _successState(query: 'flutter', repositoryCount: 40),
      ),
    );

    final firstList = tester.widget<ListView>(find.byType(ListView));
    final firstController = firstList.controller!;
    await tester.drag(find.byType(ListView), const Offset(0, -1200));
    await tester.pump();
    expect(firstController.offset, greaterThan(0));

    await tester.pumpWidget(
      _TestApp(
        searchBloc: searchBloc,
        favoritesBloc: favoritesBloc,
        state: _successState(query: 'dart sdk', repositoryCount: 3),
      ),
    );
    await tester.pump();

    final secondController = tester
        .widget<ListView>(find.byType(ListView))
        .controller!;
    expect(secondController, isNot(same(firstController)));
    expect(secondController.offset, 0);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
  });
}

final class _TestApp extends StatelessWidget {
  const _TestApp({
    required this.searchBloc,
    required this.favoritesBloc,
    required this.state,
  });

  final SearchBloc searchBloc;
  final FavoritesBloc favoritesBloc;
  final SearchState state;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => searchBloc),
          BlocProvider(create: (_) => favoritesBloc),
        ],
        child: Scaffold(
          body: SearchResults(
            key: ValueKey(state.query),
            state: state,
            onRefresh: _completeRefresh,
          ),
        ),
      ),
    );
  }

  Future<void> _completeRefresh() async {}
}

SearchState _successState({
  required String query,
  required int repositoryCount,
}) {
  return SearchState(
    status: SearchStatus.success,
    query: query,
    pages: {
      1: RepositoryPage(
        repositories: List.generate(
          repositoryCount,
          (index) => GithubRepository(
            id: index,
            name: '$query-$index',
            owner: 'owner',
            description: 'Repository $index for $query',
            stars: index,
            forks: 0,
            openIssues: 0,
            language: 'Dart',
            githubUrl: Uri.parse(
              'https://github.com/owner/repository-$index',
            ),
          ),
        ),
        page: 1,
        hasNextPage: false,
        origin: DataOrigin.network,
        fetchedAt: DateTime.utc(2026),
      ),
    },
  );
}
