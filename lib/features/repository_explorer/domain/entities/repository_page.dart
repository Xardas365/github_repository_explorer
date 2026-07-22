import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';

part 'repository_page.freezed.dart';

enum DataOrigin { cache, network }

@freezed
abstract class RepositoryPage with _$RepositoryPage {
  const factory RepositoryPage({
    required List<GithubRepository> repositories,
    required int page,
    required bool hasNextPage,
    required DataOrigin origin,
    required DateTime fetchedAt,
    @Default(false) bool isStale,
    Failure? refreshFailure,
  }) = _RepositoryPage;
}
