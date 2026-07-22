import 'package:flutter/material.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/favorite_button.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/number_format.dart';
import 'package:go_router/go_router.dart';

final class RepositoryCard extends StatelessWidget {
  const RepositoryCard({required this.repository, super.key});

  final GithubRepository repository;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      button: true,
      label:
          '${repository.owner} slash ${repository.name}, '
          '${repository.stars} stars',
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => context.pushNamed(
            'repositoryDetail',
            pathParameters: {'id': repository.id.toString()},
            extra: repository,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 16, 8, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const SizedBox.square(
                    dimension: 46,
                    child: Icon(Icons.folder_outlined),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        repository.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        repository.owner,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        repository.description.isEmpty
                            ? 'No description provided.'
                            : repository.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 14,
                        runSpacing: 8,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          _Metadata(
                            icon: Icons.star_outline,
                            label: compactCount(repository.stars),
                            semanticLabel: '${repository.stars} stars',
                          ),
                          if (repository.language != null)
                            _Metadata(
                              icon: Icons.code,
                              label: repository.language!,
                              semanticLabel:
                                  'Primary language ${repository.language}',
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                FavoriteButton(repository: repository),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final class _Metadata extends StatelessWidget {
  const _Metadata({
    required this.icon,
    required this.label,
    required this.semanticLabel,
  });

  final IconData icon;
  final String label;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 17),
          const SizedBox(width: 5),
          Text(label, style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}
