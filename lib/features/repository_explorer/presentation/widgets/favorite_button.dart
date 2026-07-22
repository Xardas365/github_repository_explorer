import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/bloc/favorites/favorites_bloc.dart';

final class FavoriteButton extends StatelessWidget {
  const FavoriteButton({required this.repository, super.key});

  final GithubRepository repository;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (previous, current) =>
          previous.repositories != current.repositories ||
          previous.pendingRepositoryIds != current.pendingRepositoryIds,
      builder: (context, state) {
        final isFavorite = state.contains(repository.id);
        final isPending = state.pendingRepositoryIds.contains(repository.id);
        return Semantics(
          button: true,
          label: isFavorite
              ? 'Remove ${repository.name} from favorites'
              : 'Add ${repository.name} to favorites',
          child: IconButton(
            tooltip: isFavorite ? 'Remove from favorites' : 'Add to favorites',
            onPressed: isPending
                ? null
                : () => context.read<FavoritesBloc>().add(
                    FavoritesEvent.setRequested(
                      repository: repository,
                      isFavorite: !isFavorite,
                    ),
                  ),
            icon: isPending
                ? const SizedBox.square(
                    dimension: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Icon(isFavorite ? Icons.star : Icons.star_outline),
          ),
        );
      },
    );
  }
}
