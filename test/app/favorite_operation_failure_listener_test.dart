import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_explorer/app/app.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/repositories/favorite_repositories_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/use_cases/set_repository_favorite.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/use_cases/watch_favorites.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/bloc/favorites/favorites_bloc.dart';

import '../helpers/fixtures.dart';

final class _FailingFavoriteRepository
    implements FavoriteRepositoriesRepository {
  @override
  Future<Result<void>> setFavorite(
    GithubRepository repository, {
    required bool isFavorite,
  }) async => const Result.failure(Failure.cache());

  @override
  Stream<Result<List<GithubRepository>>> watchFavorites() =>
      const Stream.empty();
}

void main() {
  testWidgets('shows one SnackBar for one favorite operation failure', (
    tester,
  ) async {
    final repository = _FailingFavoriteRepository();
    final bloc = FavoritesBloc(
      watchFavorites: WatchFavorites(repository),
      setRepositoryFavorite: SetRepositoryFavorite(repository),
    );
    final messengerKey = GlobalKey<ScaffoldMessengerState>();
    await tester.pumpWidget(
      BlocProvider.value(
        value: bloc,
        child: FavoriteOperationFailureListener(
          scaffoldMessengerKey: messengerKey,
          child: MaterialApp(
            scaffoldMessengerKey: messengerKey,
            home: const Scaffold(body: SizedBox.expand()),
          ),
        ),
      ),
    );

    bloc.add(
      FavoritesEvent.setRequested(
        repository: sampleRepository,
        isFavorite: true,
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Saved data could not be read.'), findsOneWidget);
    await bloc.close();
  });
}
