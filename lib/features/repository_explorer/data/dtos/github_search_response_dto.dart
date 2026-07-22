import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_search_response_dto.freezed.dart';
part 'github_search_response_dto.g.dart';

@freezed
abstract class GithubOwnerDto with _$GithubOwnerDto {
  const factory GithubOwnerDto({required String login}) = _GithubOwnerDto;

  factory GithubOwnerDto.fromJson(Map<String, Object?> json) =>
      _$GithubOwnerDtoFromJson(json);
}

@freezed
abstract class GithubRepositoryDto with _$GithubRepositoryDto {
  const factory GithubRepositoryDto({
    required int id,
    required String name,
    required GithubOwnerDto owner,
    @JsonKey(name: 'stargazers_count') required int stars,
    @JsonKey(name: 'forks_count') required int forks,
    @JsonKey(name: 'open_issues_count') required int openIssues,
    @JsonKey(name: 'html_url') required String htmlUrl,
    String? description,
    String? language,
  }) = _GithubRepositoryDto;

  factory GithubRepositoryDto.fromJson(Map<String, Object?> json) =>
      _$GithubRepositoryDtoFromJson(json);
}

@freezed
abstract class GithubSearchResponseDto with _$GithubSearchResponseDto {
  const factory GithubSearchResponseDto({
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'incomplete_results') required bool incompleteResults,
    required List<GithubRepositoryDto> items,
  }) = _GithubSearchResponseDto;

  factory GithubSearchResponseDto.fromJson(Map<String, Object?> json) =>
      _$GithubSearchResponseDtoFromJson(json);
}
