import 'package:github_repository_explorer/features/repository_explorer/data/dtos/github_search_response_dto.dart';
import 'package:test/test.dart';

void main() {
  group('GithubSearchResponseDto', () {
    test('parses required API fields and nullable values', () {
      final dto = GithubSearchResponseDto.fromJson(
        <String, Object?>{
          'total_count': 1,
          'incomplete_results': false,
          'items': <Object?>[
            <String, Object?>{
              'id': 42,
              'name': 'flutter',
              'owner': <String, Object?>{'login': 'flutter'},
              'description': null,
              'stargazers_count': 170000,
              'forks_count': 28000,
              'open_issues_count': 13000,
              'language': null,
              'html_url': 'https://github.com/flutter/flutter',
            },
          ],
        },
      );

      expect(dto.totalCount, 1);
      expect(dto.incompleteResults, isFalse);
      expect(dto.items.single.owner.login, 'flutter');
      expect(dto.items.single.description, isNull);
      expect(dto.items.single.language, isNull);
      expect(dto.items.single.stars, 170000);
    });
  });
}
