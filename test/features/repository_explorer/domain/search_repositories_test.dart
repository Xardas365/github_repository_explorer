import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_page.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_search_request.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/repositories/repository_search_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/use_cases/search_repositories.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

final class _MockSearchRepository extends Mock
    implements RepositorySearchRepository {}

void main() {
  late _MockSearchRepository repository;
  late SearchRepositories useCase;

  setUpAll(() {
    registerFallbackValue(const RepositorySearchRequest(query: 'fallback'));
  });

  setUp(() {
    repository = _MockSearchRepository();
    useCase = SearchRepositories(repository);
  });

  test('normalizes the query before delegating to the repository', () async {
    final page = RepositoryPage(
      repositories: const [],
      page: 1,
      hasNextPage: false,
      origin: DataOrigin.network,
      fetchedAt: DateTime.utc(2026),
    );
    when(() => repository.search(any())).thenAnswer(
      (_) => Stream.value(Result.success(page)),
    );

    await useCase(
      const RepositorySearchRequest(query: '  flutter   bloc  '),
    ).drain<void>();

    final captured = verify(() => repository.search(captureAny())).captured;
    expect(captured.single, isA<RepositorySearchRequest>());
    expect((captured.single as RepositorySearchRequest).query, 'flutter bloc');
  });

  test('rejects a query shorter than two characters', () async {
    final result = await useCase(
      const RepositorySearchRequest(query: 'f'),
    ).single;

    expect(
      result,
      const Result<RepositoryPage>.failure(
        Failure.validation(
          code: ValidationFailureCode.inputTooShort,
          minimumLength: 2,
        ),
      ),
    );
    verifyNever(() => repository.search(any()));
  });
}
