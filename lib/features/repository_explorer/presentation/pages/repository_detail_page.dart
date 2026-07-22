import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/content_width.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/favorite_button.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/number_format.dart';
import 'package:url_launcher/url_launcher.dart';

final class RepositoryDetailPage extends StatelessWidget {
  const RepositoryDetailPage({required this.repository, super.key});

  final GithubRepository repository;

  Future<void> _openGithub(BuildContext context) async {
    final opened = await launchUrl(
      repository.githubUrl,
      mode: LaunchMode.externalApplication,
    );
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the GitHub page.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repository details'),
        actions: [
          FavoriteButton(repository: repository),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocListener<FavoritesBloc, FavoritesState>(
        listenWhen: (previous, current) =>
            previous.operationFailure != current.operationFailure &&
            current.operationFailure != null,
        listener: (context, state) {
          final failure = state.operationFailure;
          if (failure != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(failure.message)));
          }
        },
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 32),
            child: ContentWidth(
              maxWidth: 920,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const SizedBox.square(
                          dimension: 72,
                          child: Icon(Icons.folder_outlined, size: 36),
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              repository.name,
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              repository.owner,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Text('About', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(
                    repository.description.isEmpty
                        ? 'No description provided.'
                        : repository.description,
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Repository activity',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _StatCard(
                        icon: Icons.star_outline,
                        label: 'Stars',
                        value: compactCount(repository.stars),
                      ),
                      _StatCard(
                        icon: Icons.call_split,
                        label: 'Forks',
                        value: compactCount(repository.forks),
                      ),
                      _StatCard(
                        icon: Icons.error_outline,
                        label: 'Open issues',
                        value: compactCount(repository.openIssues),
                      ),
                      _StatCard(
                        icon: Icons.code,
                        label: 'Language',
                        value: repository.language ?? 'Not specified',
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Semantics(
                    button: true,
                    label: 'Open ${repository.name} on GitHub',
                    child: FilledButton.icon(
                      onPressed: () => _openGithub(context),
                      icon: const Icon(Icons.open_in_new),
                      label: const Text('Open on GitHub'),
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(52),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SelectableText(
                    repository.githubUrl.toString(),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      label: '$label: $value',
      excludeSemantics: true,
      child: Container(
        width: 196,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Row(
          children: [
            Icon(icon, color: theme.colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: theme.textTheme.labelMedium),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class MissingRepositoryPage extends StatelessWidget {
  const MissingRepositoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Repository details')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Text(
            'Repository details are no longer available. Return to search and '
            'open the repository again.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
