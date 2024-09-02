import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:p3_app_dev/pages/home.dart';
import 'package:p3_app_dev/pages/logIn.dart';
import 'package:p3_app_dev/pages/sample.dart';

void main() => runApp(const MyApp());

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const Home();
          },
        ),
        GoRoute(
          path: 'sample',
          builder: (BuildContext context, GoRouterState state) {
            return const Sample();
          },
        ),
      ],
      
    ),
  ],
);

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
