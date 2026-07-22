import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository_explorer/app/di/service_locator.dart';
import 'package:github_repository_explorer/app/router/app_router.dart';
import 'package:github_repository_explorer/app/theme/app_theme.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/bloc/favorites/favorites_bloc.dart';

final class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<FavoritesBloc>()..add(const FavoritesEvent.started()),
      child: MaterialApp.router(
        title: 'Repo Scout',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
