import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repository.freezed.dart';

@freezed
abstract class GithubRepository with _$GithubRepository {
  const factory GithubRepository({
    required int id,
    required String name,
    required String owner,
    required String description,
    required int stars,
    required int forks,
    required int openIssues,
    required String? language,
    required Uri githubUrl,
  }) = _GithubRepository;
}
