import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/repositories/favorite_repositories_repository.dart';

final class WatchFavorites {
  const WatchFavorites(this._repository);

  final FavoriteRepositoriesRepository _repository;

  Stream<Result<List<GithubRepository>>> call() => _repository.watchFavorites();
}
