import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';

abstract interface class FavoriteRepositoriesRepository {
  Stream<Result<List<GithubRepository>>> watchFavorites();

  Future<Result<void>> setFavorite(
    GithubRepository repository, {
    required bool isFavorite,
  });
}
