import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_page.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_search_request.dart';

abstract interface class RepositorySearchRepository {
  Stream<Result<RepositoryPage>> search(RepositorySearchRequest request);
}
