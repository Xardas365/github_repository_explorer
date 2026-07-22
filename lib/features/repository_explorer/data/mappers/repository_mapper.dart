import 'package:github_repository_explorer/features/repository_explorer/data/database/cached_repository_model.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/dtos/github_search_response_dto.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';

extension GithubRepositoryDtoMapper on GithubRepositoryDto {
  GithubRepository toDomain() => GithubRepository(
    id: id,
    name: name,
    owner: owner.login,
    description: description?.trim() ?? '',
    stars: stars,
    forks: forks,
    openIssues: openIssues,
    language: language,
    githubUrl: Uri.parse(htmlUrl),
  );
}

extension CachedRepositoryMapper on CachedRepositoryModel {
  GithubRepository toDomain() => GithubRepository(
    id: id,
    name: name,
    owner: owner,
    description: description,
    stars: stars,
    forks: forks,
    openIssues: openIssues,
    language: language,
    githubUrl: Uri.parse(githubUrl),
  );
}

extension GithubRepositoryCacheMapper on GithubRepository {
  CachedRepositoryModel toCache(DateTime updatedAt) => CachedRepositoryModel(
    id: id,
    name: name,
    owner: owner,
    description: description,
    stars: stars,
    forks: forks,
    openIssues: openIssues,
    language: language,
    githubUrl: githubUrl.toString(),
    updatedAt: updatedAt,
  );
}
