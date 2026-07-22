import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/repositories/favorite_repositories_repository.dart';

final class SetRepositoryFavorite {
  const SetRepositoryFavorite(this._repository);

  final FavoriteRepositoriesRepository _repository;

  Future<Result<void>> call(
    GithubRepository repository, {
    required bool isFavorite,
  }) => _repository.setFavorite(repository, isFavorite: isFavorite);
}
