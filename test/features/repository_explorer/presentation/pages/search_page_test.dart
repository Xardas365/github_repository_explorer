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

final class _FakeSearchRepository implements RepositorySearchRepository {
  @override
  Stream<Result<RepositoryPage>> search(RepositorySearchRequest request) {
    final count = request.query == 'flutter' ? 40 : 3;
    return Stream.value(
      Result.success(
        RepositoryPage(
          repositories: List.generate(
            count,
            (index) => GithubRepository(
              id: index,
              name: '${request.query}-$index',
              owner: 'owner',
              description: 'Repository $index for ${request.query}',
              stars: index,
              forks: 0,
              openIssues: 0,
              language: 'Dart',
              githubUrl: Uri.parse(
                'https://github.com/owner/repository-$index',
              ),
            ),
          ),
          page: request.page,
          hasNextPage: false,
          origin: DataOrigin.network,
          fetchedAt: DateTime.utc(2026),
        ),
      ),
    );
  }
}

final class _FakeFavoritesRepository implements FavoriteRepositoriesRepository {
  @override
  Future<Result<void>> setFavorite(
    GithubRepository repository, {
    required bool isFavorite,
  }) async => const Result.success(null);

  @override
  Stream<Result<List<GithubRepository>>> watchFavorites() =>
      Stream.value(const Result.success([]));
}

void main() {
  testWidgets('resets the result scroll position for a new normalized query', (
    tester,
  ) async {
    final searchBloc = SearchBloc(
      searchRepositories: SearchRepositories(_FakeSearchRepository()),
    );
    final favoritesRepository = _FakeFavoritesRepository();
    final favoritesBloc = FavoritesBloc(
      watchFavorites: WatchFavorites(favoritesRepository),
      setRepositoryFavorite: SetRepositoryFavorite(favoritesRepository),
    );
    addTearDown(searchBloc.close);
    addTearDown(favoritesBloc.close);

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: searchBloc),
            BlocProvider.value(value: favoritesBloc),
          ],
          child: const SearchPage(),
        ),
      ),
    );

    final firstSearch = searchBloc.stream.firstWhere(
      (state) =>
          state.query == 'flutter' && state.status == SearchStatus.success,
    );
    searchBloc.add(const SearchEvent.submitted('flutter'));
    await firstSearch;
    await tester.pump();

    final firstList = tester.widget<ListView>(find.byType(ListView));
    final firstController = firstList.controller!;
    await tester.drag(find.byType(ListView), const Offset(0, -1200));
    await tester.pump();
    expect(firstController.offset, greaterThan(0));

    final secondSearch = searchBloc.stream.firstWhere(
      (state) =>
          state.query == 'dart sdk' && state.status == SearchStatus.success,
    );
    searchBloc.add(const SearchEvent.submitted('  dart   sdk  '));
    await secondSearch;
    await tester.pump();

    final secondController = tester
        .widget<ListView>(find.byType(ListView))
        .controller!;
    expect(secondController, isNot(same(firstController)));
    expect(secondController.offset, 0);
  });
}
