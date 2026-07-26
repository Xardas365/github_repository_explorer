import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/bloc/search/search_bloc.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/app_state_panel.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/cache_status_banner.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/content_width.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/failure_message.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/repository_card.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/search_input.dart';

final class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) => const _SearchView();
}

final class _SearchView extends StatefulWidget {
  const _SearchView();

  @override
  State<_SearchView> createState() => _SearchViewState();
}

final class _SearchViewState extends State<_SearchView> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreIfNeeded);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_loadMoreIfNeeded)
      ..dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _loadMoreIfNeeded() {
    if (_scrollController.position.extentAfter < 500) {
      context.read<SearchBloc>().add(const SearchEvent.loadNextPage());
    }
  }

  Future<void> _refresh() async {
    final bloc = context.read<SearchBloc>()..add(const SearchEvent.refreshed());
    await bloc.stream.firstWhere((state) => !state.isRefreshing);
  }

  void _showFavoriteError(FavoritesState state) {
    final failure = state.operationFailure;
    if (failure == null) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(failure.message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<FavoritesBloc, FavoritesState>(
          listenWhen: (previous, current) =>
              previous.operationFailure != current.operationFailure &&
              current.operationFailure != null,
          listener: (context, state) => _showFavoriteError(state),
          child: ContentWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                Text(
                  'Explore GitHub',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Find public repositories, inspect the details, and keep '
                  'favorites available offline.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 20),
                SearchInput(
                  controller: _searchController,
                  onChanged: (query) => context.read<SearchBloc>().add(
                    SearchEvent.queryChanged(query),
                  ),
                  onSubmitted: (query) => context.read<SearchBloc>().add(
                    SearchEvent.submitted(query),
                  ),
                  onCleared: () {
                    _searchController.clear();
                    context.read<SearchBloc>().add(
                      const SearchEvent.queryChanged(''),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) => _SearchResults(
                      state: state,
                      scrollController: _scrollController,
                      onRefresh: _refresh,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final class _SearchResults extends StatelessWidget {
  const _SearchResults({
    required this.state,
    required this.scrollController,
    required this.onRefresh,
  });

  final SearchState state;
  final ScrollController scrollController;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case SearchStatus.initial:
        return AppStatePanel(
          icon: Icons.travel_explore,
          title: state.query.length == 1
              ? 'Type one more character'
              : 'Start exploring',
          message: 'Search by technology, project name, or topic.',
        );
      case SearchStatus.loading:
        return Center(
          child: Semantics(
            liveRegion: true,
            label: 'Loading repositories',
            child: const CircularProgressIndicator(),
          ),
        );
      case SearchStatus.empty:
        return const AppStatePanel(
          icon: Icons.search_off,
          title: 'No repositories found',
          message: 'Try a broader query or check the spelling.',
        );
      case SearchStatus.failure:
        final failure = state.failure;
        return AppStatePanel(
          icon: Icons.cloud_off_outlined,
          title: 'Search failed',
          message: failure == null
              ? 'Unable to load repositories.'
              : formatFailureMessage(context, failure),
          actionLabel: 'Try again',
          onAction: () =>
              context.read<SearchBloc>().add(const SearchEvent.retryPage(1)),
        );
      case SearchStatus.success:
        return Column(
          children: [
            if (state.isFromCache || state.refreshFailure != null) ...[
              CacheStatusBanner(
                isStale: state.isStale,
                fetchedAt: state.fetchedAt,
                refreshFailure: state.refreshFailure,
                onRetry: () => context.read<SearchBloc>().add(
                  const SearchEvent.retryPage(1),
                ),
              ),
              const SizedBox(height: 12),
            ],
            Expanded(
              child: RefreshIndicator(
                onRefresh: onRefresh,
                child: ListView.separated(
                  key: const PageStorageKey('repository-search-results'),
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 24),
                  itemCount: state.repositories.length + 1,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    if (index < state.repositories.length) {
                      return RepositoryCard(
                        repository: state.repositories[index],
                      );
                    }
                    return _PaginationFooter(state: state);
                  },
                ),
              ),
            ),
          ],
        );
    }
  }
}

final class _PaginationFooter extends StatelessWidget {
  const _PaginationFooter({required this.state});

  final SearchState state;

  @override
  Widget build(BuildContext context) {
    if (state.isLoadingNextPage) {
      return const Padding(
        padding: EdgeInsets.all(20),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (state.paginationFailure case final failure?) {
      final failedPage = state.paginationFailurePage;
      return Center(
        child: TextButton.icon(
          onPressed: failedPage == null
              ? null
              : () => context.read<SearchBloc>().add(
                  SearchEvent.retryPage(failedPage),
                ),
          icon: const Icon(Icons.refresh),
          label: Text('${formatFailureMessage(context, failure)} Retry'),
        ),
      );
    }
    if (state.hasReachedEnd) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: Text('End of results')),
      );
    }
    return const SizedBox(height: 32);
  }
}
