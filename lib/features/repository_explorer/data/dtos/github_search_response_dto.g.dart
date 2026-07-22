// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GithubOwnerDto _$GithubOwnerDtoFromJson(Map<String, dynamic> json) =>
    _GithubOwnerDto(login: json['login'] as String);

Map<String, dynamic> _$GithubOwnerDtoToJson(_GithubOwnerDto instance) =>
    <String, dynamic>{'login': instance.login};

_GithubRepositoryDto _$GithubRepositoryDtoFromJson(Map<String, dynamic> json) =>
    _GithubRepositoryDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      owner: GithubOwnerDto.fromJson(json['owner'] as Map<String, dynamic>),
      stars: (json['stargazers_count'] as num).toInt(),
      forks: (json['forks_count'] as num).toInt(),
      openIssues: (json['open_issues_count'] as num).toInt(),
      htmlUrl: json['html_url'] as String,
      description: json['description'] as String?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$GithubRepositoryDtoToJson(
  _GithubRepositoryDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'owner': instance.owner,
  'stargazers_count': instance.stars,
  'forks_count': instance.forks,
  'open_issues_count': instance.openIssues,
  'html_url': instance.htmlUrl,
  'description': instance.description,
  'language': instance.language,
};

_GithubSearchResponseDto _$GithubSearchResponseDtoFromJson(
  Map<String, dynamic> json,
) => _GithubSearchResponseDto(
  totalCount: (json['total_count'] as num).toInt(),
  incompleteResults: json['incomplete_results'] as bool,
  items: (json['items'] as List<dynamic>)
      .map((e) => GithubRepositoryDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GithubSearchResponseDtoToJson(
  _GithubSearchResponseDto instance,
) => <String, dynamic>{
  'total_count': instance.totalCount,
  'incomplete_results': instance.incompleteResults,
  'items': instance.items,
};
