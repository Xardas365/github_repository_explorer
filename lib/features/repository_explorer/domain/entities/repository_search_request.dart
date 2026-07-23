import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_search_request.freezed.dart';

@freezed
abstract class RepositorySearchRequest with _$RepositorySearchRequest {
  const factory RepositorySearchRequest({
    required String query,
    @Default(1) int page,
    @Default(false) bool forceRefresh,
  }) = _RepositorySearchRequest;
}

extension RepositorySearchRequestX on RepositorySearchRequest {
  RepositorySearchRequest normalized() =>
      copyWith(query: query.trim().replaceAll(RegExp(r'\s+'), ' '));
}
