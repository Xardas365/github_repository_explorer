import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:github_repository_explorer/core/cache/cache_policy.dart';
import 'package:github_repository_explorer/core/error/app_exception.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/data_sources/github_remote_data_source.dart';
import 'package:test/test.dart';

import '../../../helpers/test_logger.dart';

void main() {
  group('DioGithubRemoteDataSource pagination', () {
    test('offers a next page for an ordinary full page', () async {
      final page = await _search(page: 1, totalCount: 90, itemCount: 30);

      expect(page.hasNextPage, isTrue);
    });

    test(
      'offers page 33 from page 32 when total count exceeds the API window',
      () async {
        final page = await _search(page: 32, totalCount: 1500, itemCount: 30);

        expect(page.hasNextPage, isTrue);
      },
    );

    test('offers page 34 from page 33 when total count exceeds 1000', () async {
      final page = await _search(page: 33, totalCount: 1500, itemCount: 30);

      expect(page.hasNextPage, isTrue);
    });

    test('stops after page 34 at the GitHub result window', () async {
      final page = await _search(page: 34, totalCount: 1500, itemCount: 30);

      expect(page.hasNextPage, isFalse);
    });

    test('stops on page 33 when total count is exactly 990', () async {
      final page = await _search(page: 33, totalCount: 990, itemCount: 30);

      expect(page.hasNextPage, isFalse);
    });

    test('offers page 34 from page 33 when total count is 995', () async {
      final page = await _search(page: 33, totalCount: 995, itemCount: 30);

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

  test('forwards cancellation to the active Dio request', () async {
    final adapter = _CancellableAdapter();
    final dio = Dio(BaseOptions(baseUrl: 'https://api.github.test'))
      ..httpClientAdapter = adapter;
    final cancelToken = CancelToken();
    final search =
        DioGithubRemoteDataSource(
          dio,
          clock: _FakeClock(DateTime.utc(2026, 7, 23, 12)),
          logger: RecordingAppLogger(),
        ).search(
          query: 'flutter',
          page: 1,
          pageSize: 30,
          cancelToken: cancelToken,
        );
    await adapter.started.future;

    cancelToken.cancel('Superseded');

    await expectLater(
      search,
      throwsA(
        isA<DioException>().having(
          CancelToken.isCancel,
          'is cancellation',
          isTrue,
        ),
      ),
    );
    expect(adapter.cancelled, isTrue);
    dio.close(force: true);
  });

  group('DioGithubRemoteDataSource failures', () {
    final now = DateTime.utc(2026, 7, 23, 12);

    test('classifies an invalid GitHub search as validation', () async {
      final exception = await _searchError(now: now, statusCode: 422);

      expect(
        exception,
        isA<ValidationException>().having(
          (error) => error.code,
          'code',
          ValidationFailureCode.invalidInput,
        ),
      );
    });

    test('classifies another client response as request rejected', () async {
      final exception = await _searchError(now: now, statusCode: 404);

      expect(exception, isA<RequestRejectedException>());
    });

    test('logs malformed response details but exposes a typed error', () async {
      final logger = RecordingAppLogger();
      final exception = await _searchError(
        now: now,
        statusCode: 200,
        body: const <String, Object?>{
          'total_count': 1,
          'incomplete_results': false,
          'items': 'not-a-list',
        },
        logger: logger,
      );

      expect(exception, isA<ParsingException>());
      expect(logger.errors, hasLength(1));
      expect(logger.errors.single.error, isA<TypeError>());
    });
  });

  group('DioGithubRemoteDataSource rate limits', () {
    final now = DateTime.utc(2026, 7, 23, 12);

    test('uses Retry-After when a secondary limit has no reset', () async {
      final exception = await _searchError(
        now: now,
        statusCode: 403,
        headers: const <String, List<String>>{
          'retry-after': <String>['120'],
        },
        body: const <String, Object?>{
          'message': 'You have exceeded a secondary rate limit.',
        },
      );

      expect(
        exception,
        isA<RateLimitException>().having(
          (error) => error.retryAt,
          'retryAt',
          now.add(const Duration(minutes: 2)),
        ),
      );
    });

    test('prefers Retry-After to an unrelated primary reset', () async {
      final exception = await _searchError(
        now: now,
        statusCode: 403,
        headers: <String, List<String>>{
          'retry-after': const <String>['60'],
          'x-ratelimit-remaining': const <String>['42'],
          'x-ratelimit-reset': <String>[
            '${now.add(const Duration(hours: 1)).millisecondsSinceEpoch ~/ 1000}',
          ],
        },
        body: const <String, Object?>{
          'message': 'You have exceeded a secondary rate limit.',
        },
      );

      expect(
        exception,
        isA<RateLimitException>().having(
          (error) => error.retryAt,
          'retryAt',
          now.add(const Duration(minutes: 1)),
        ),
      );
    });

    test('uses reset time for an exhausted primary limit', () async {
      final resetAt = now.add(const Duration(minutes: 30));
      final exception = await _searchError(
        now: now,
        statusCode: 403,
        headers: <String, List<String>>{
          'x-ratelimit-remaining': const <String>['0'],
          'x-ratelimit-reset': <String>[
            '${resetAt.millisecondsSinceEpoch ~/ 1000}',
          ],
        },
      );

      expect(
        exception,
        isA<RateLimitException>().having(
          (error) => error.retryAt,
          'retryAt',
          resetAt,
        ),
      );
    });

    test('guards a secondary limit without timing for one minute', () async {
      final exception = await _searchError(
        now: now,
        statusCode: 403,
        body: const <String, Object?>{
          'documentation_url':
              'https://docs.github.com/rest/using-the-rest-api/'
              'rate-limits-for-the-rest-api#about-secondary-rate-limits',
        },
      );

      expect(
        exception,
        isA<RateLimitException>().having(
          (error) => error.retryAt,
          'retryAt',
          now.add(const Duration(minutes: 1)),
        ),
      );
    });

    test(
      'does not classify an ordinary forbidden response as a limit',
      () async {
        final exception = await _searchError(
          now: now,
          statusCode: 403,
          body: const <String, Object?>{'message': 'Resource not accessible'},
        );

        expect(exception, isA<RequestRejectedException>());
      },
    );

    test('guards a 429 response without timing for one minute', () async {
      final exception = await _searchError(now: now, statusCode: 429);

      expect(
        exception,
        isA<RateLimitException>().having(
          (error) => error.retryAt,
          'retryAt',
          now.add(const Duration(minutes: 1)),
        ),
      );
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
    ..httpClientAdapter = _JsonResponseAdapter(<String, Object?>{
      'total_count': totalCount,
      'incomplete_results': incompleteResults,
      'items': [for (var index = 0; index < itemCount; index++) _item(index)],
    });
  try {
    return await DioGithubRemoteDataSource(
      dio,
      clock: _FakeClock(DateTime.utc(2026, 7, 23, 12)),
      logger: RecordingAppLogger(),
    ).search(
      query: 'flutter',
      page: page,
      pageSize: 30,
      cancelToken: CancelToken(),
    );
  } finally {
    dio.close(force: true);
  }
}

Future<AppException> _searchError({
  required DateTime now,
  required int statusCode,
  Map<String, List<String>> headers = const <String, List<String>>{},
  Object? body,
  RecordingAppLogger? logger,
}) async {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.github.test'))
    ..httpClientAdapter = _JsonResponseAdapter(
      body ?? const <String, Object?>{},
      statusCode: statusCode,
      headers: headers,
    );
  try {
    await DioGithubRemoteDataSource(
      dio,
      clock: _FakeClock(now),
      logger: logger ?? RecordingAppLogger(),
    ).search(
      query: 'flutter',
      page: 1,
      pageSize: 30,
      cancelToken: CancelToken(),
    );
    fail('Expected the search to throw an AppException.');
  } on AppException catch (error) {
    return error;
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
  const _JsonResponseAdapter(
    this.body, {
    this.statusCode = 200,
    this.headers = const <String, List<String>>{},
  });

  final Object? body;
  final int statusCode;
  final Map<String, List<String>> headers;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async => ResponseBody.fromString(
    jsonEncode(body),
    statusCode,
    headers: <String, List<String>>{
      Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      ...headers,
    },
  );

  @override
  void close({bool force = false}) {}
}

final class _CancellableAdapter implements HttpClientAdapter {
  final started = Completer<void>();
  bool cancelled = false;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    started.complete();
    await cancelFuture;
    cancelled = true;
    throw DioException(
      requestOptions: options,
      type: DioExceptionType.cancel,
      error: 'Superseded',
    );
  }

  @override
  void close({bool force = false}) {}
}

final class _FakeClock implements Clock {
  const _FakeClock(this.current);

  final DateTime current;

  @override
  DateTime now() => current;
}
