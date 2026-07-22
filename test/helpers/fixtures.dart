import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';

final sampleRepository = GithubRepository(
  id: 42,
  name: 'flutter',
  owner: 'flutter',
  description: 'Flutter makes it easy to build beautiful apps.',
  stars: 170000,
  forks: 28000,
  openIssues: 13000,
  language: 'Dart',
  githubUrl: Uri.parse('https://github.com/flutter/flutter'),
);
