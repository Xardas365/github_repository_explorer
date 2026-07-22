import 'package:freezed_annotation/freezed_annotation.dart';

part 'cached_repository_model.freezed.dart';

@freezed
abstract class CachedRepositoryModel with _$CachedRepositoryModel {
  const factory CachedRepositoryModel({
    required int id,
    required String name,
    required String owner,
    required String description,
    required int stars,
    required int forks,
    required int openIssues,
    required String? language,
    required String githubUrl,
    required DateTime updatedAt,
  }) = _CachedRepositoryModel;
}

@freezed
abstract class CachedRepositoryPage with _$CachedRepositoryPage {
  const factory CachedRepositoryPage({
    required List<CachedRepositoryModel> repositories,
    required int page,
    required bool hasNextPage,
    required DateTime fetchedAt,
  }) = _CachedRepositoryPage;
}
