import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_page.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_search_request.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/repositories/repository_search_repository.dart';

final class SearchRepositories {
  const SearchRepositories(this._repository);

  final RepositorySearchRepository _repository;

  Stream<Result<RepositoryPage>> call(RepositorySearchRequest request) {
    final normalized = request.normalized();
    if (normalized.query.length < 2) {
      return Stream.value(
        const Result.failure(
          Failure.validation(
            code: ValidationFailureCode.inputTooShort,
            minimumLength: 2,
          ),
        ),
      );
    }
    return _repository.search(normalized);
  }
}
