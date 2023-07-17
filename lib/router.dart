import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logic_app/screens/home.dart';
import 'package:logic_app/screens/settings.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/practice",
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return HomeScreen(child: child);
      },
      routes: [
        GoRoute(
          path: "/practice",
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const Text("Practice"),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: "/progress",
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const Text("Progress"),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: "/competition",
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const Text("Competition"),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: "/settings",
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const SettingsScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
      ],
    ),
  ],
);
