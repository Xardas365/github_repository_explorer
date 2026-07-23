import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository_explorer/app/di/service_locator.dart';
import 'package:github_repository_explorer/app/router/app_shell.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/github_repository.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/bloc/search/search_bloc.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/pages/favorites_page.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/pages/repository_detail_page.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/pages/search_page.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => AppShell(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                name: 'search',
                builder: (context, state) => BlocProvider(
                  create: (_) => getIt<SearchBloc>(),
                  child: const SearchPage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorites',
                name: 'favorites',
                builder: (context, state) => const FavoritesPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/repository/:id',
        name: 'repositoryDetail',
        builder: (context, state) {
          final repository = state.extra;
          if (repository is GithubRepository) {
            return RepositoryDetailPage(repository: repository);
          }
          return const MissingRepositoryPage();
        },
      ),
    ],
  );
}
