import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/app_state_panel.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/content_width.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/repository_card.dart';

final class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text(
                'Favorites',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Saved repositories remain available after restarting the app.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<FavoritesBloc, FavoritesState>(
                  builder: (context, state) => _FavoritesContent(state: state),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _FavoritesContent extends StatelessWidget {
  const _FavoritesContent({required this.state});

  final FavoritesState state;

  @override
  Widget build(BuildContext context) {
    return switch (state.status) {
      FavoritesStatus.initial || FavoritesStatus.loading => Center(
        child: Semantics(
          liveRegion: true,
          label: 'Loading favorites',
          child: const CircularProgressIndicator(),
        ),
      ),
      FavoritesStatus.failure => AppStatePanel(
        icon: Icons.error_outline,
        title: 'Favorites unavailable',
        message: state.failure?.message ?? 'Saved repositories could not load.',
        actionLabel: 'Try again',
        onAction: () =>
            context.read<FavoritesBloc>().add(const FavoritesEvent.started()),
      ),
      FavoritesStatus.success when state.repositories.isEmpty =>
        const AppStatePanel(
          icon: Icons.star_outline,
          title: 'No favorites yet',
          message: 'Tap the star on a repository to keep it here.',
        ),
      FavoritesStatus.success => ListView.separated(
        key: const PageStorageKey('favorite-repositories'),
        padding: const EdgeInsets.only(bottom: 24),
        itemCount: state.repositories.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) => RepositoryCard(
          repository: state.repositories[index],
        ),
      ),
    };
  }
}
