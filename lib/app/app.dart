import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository_explorer/app/di/service_locator.dart';
import 'package:github_repository_explorer/app/router/app_router.dart';
import 'package:github_repository_explorer/app/theme/app_theme.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/bloc/favorites/favorites_bloc.dart';

final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

final class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<FavoritesBloc>()..add(const FavoritesEvent.started()),
      child: FavoriteOperationFailureListener(
        scaffoldMessengerKey: _scaffoldMessengerKey,
        child: MaterialApp.router(
          scaffoldMessengerKey: _scaffoldMessengerKey,
          title: 'Repo Scout',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}

final class FavoriteOperationFailureListener extends StatelessWidget {
  const FavoriteOperationFailureListener({
    required this.scaffoldMessengerKey,
    required this.child,
    super.key,
  });

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoritesBloc, FavoritesState>(
      listenWhen: (previous, current) =>
          previous.operationFailure != current.operationFailure &&
          current.operationFailure != null,
      listener: (context, state) {
        final failure = state.operationFailure;
        final messenger = scaffoldMessengerKey.currentState;
        if (failure == null || messenger == null) return;
        messenger
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(failure.message)));
      },
      child: child,
    );
  }
}
