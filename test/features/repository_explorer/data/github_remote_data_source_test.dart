import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/data_sources/github_remote_data_source.dart';
import 'package:test/test.dart';

void main() {
  group('DioGithubRemoteDataSource pagination', () {
    test('offers a next page for an ordinary full page', () async {
      final page = await _search(page: 1, totalCount: 90, itemCount: 30);

      expect(page.hasNextPage, isTrue);
    });

    test(
      'offers page 33 from page 32 when total count exceeds the API window',
      () async {
        final page = await _search(
          page: 32,
          totalCount: 1500,
          itemCount: 30,
        );

        expect(page.hasNextPage, isTrue);
      },
    );

    test('offers page 34 from page 33 when total count exceeds 1000', () async {
      final page = await _search(
        page: 33,
        totalCount: 1500,
        itemCount: 30,
      );

      expect(page.hasNextPage, isTrue);
    });

    test('stops after page 34 at the GitHub result window', () async {
      final page = await _search(
        page: 34,
        totalCount: 1500,
        itemCount: 30,
      );

      expect(page.hasNextPage, isFalse);
    });

    test('stops on page 33 when total count is exactly 990', () async {
      final page = await _search(
        page: 33,
        totalCount: 990,
        itemCount: 30,
      );

      expect(page.hasNextPage, isFalse);
    });

    test('offers page 34 from page 33 when total count is 995', () async {
      final page = await _search(
        page: 33,
        totalCount: 995,
        itemCount: 30,
      );

      expect(page.hasNextPage, isTrue);
    });

    test('stops on the final partial page', () async {
      final page = await _search(page: 2, totalCount: 40, itemCount: 10);

      expect(page.hasNextPage, isFalse);
    });

    test('stops when GitHub marks results as incomplete', () async {
      final page = await _search(
        page: 1,
        totalCount: 90,
        itemCount: 30,
        incompleteResults: true,
      );

      expect(page.hasNextPage, isFalse);
    });
  });
}

Future<RemoteRepositoryPage> _search({
  required int page,
  required int totalCount,
  required int itemCount,
  bool incompleteResults = false,
}) async {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.github.test'))
    ..httpClientAdapter = _JsonResponseAdapter(
      <String, Object?>{
        'total_count': totalCount,
        'incomplete_results': incompleteResults,
        'items': [for (var index = 0; index < itemCount; index++) _item(index)],
      },
    );
  try {
    return await DioGithubRemoteDataSource(
      dio,
    ).search(query: 'flutter', page: page, pageSize: 30);
  } finally {
    dio.close(force: true);
  }
}

Map<String, Object?> _item(int index) => <String, Object?>{
  'id': index + 1,
  'name': 'repository-$index',
  'owner': <String, Object?>{'login': 'owner'},
  'description': 'Description',
  'stargazers_count': 10,
  'forks_count': 2,
  'open_issues_count': 1,
  'language': 'Dart',
  'html_url': 'https://github.com/owner/repository-$index',
};

final class _JsonResponseAdapter implements HttpClientAdapter {
  const _JsonResponseAdapter(this.body);

  final Map<String, Object?> body;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async => ResponseBody.fromString(
    jsonEncode(body),
    200,
    headers: <String, List<String>>{
      Headers.contentTypeHeader: <String>[Headers.jsonContentType],
    },
  );

  @override
  void close({bool force = false}) {}
}
