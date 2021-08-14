import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'shared/pages.dart';

void main() => runApp(App());

/// sample class using simple declarative routes
class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: 'Initial Location GoRouter Example',
      );

  late final _router = GoRouter(
    routes: _routesBuilder,
    error: _errorBuilder,
    initialLocation: '/page2',
  );
  List<GoRoute> _routesBuilder(BuildContext context, String location) => [
        GoRoute(
          path: '/',
          builder: (context, state) => MaterialPage<Page1Page>(
            key: state.pageKey,
            child: const Page1Page(),
          ),
        ),
        GoRoute(
          path: '/page2',
          builder: (context, state) => MaterialPage<Page2Page>(
            key: state.pageKey,
            child: const Page2Page(),
          ),
        ),
        GoRoute(
          path: '/page3',
          builder: (context, state) => MaterialPage<Page3Page>(
            key: state.pageKey,
            child: const Page3Page(),
          ),
        ),
      ];

  Page<dynamic> _errorBuilder(BuildContext context, GoRouterState state) =>
      MaterialPage<ErrorPage>(
        key: state.pageKey,
        child: ErrorPage(state.error),
      );
}