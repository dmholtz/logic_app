import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logic_app/models/quiz_config.dart';
import 'package:logic_app/screens/competition.dart';
import 'package:logic_app/screens/home.dart';
import 'package:logic_app/screens/leaderboard.dart';
import 'package:logic_app/screens/practice.dart';
import 'package:logic_app/screens/progress.dart';
import 'package:logic_app/screens/quiz.dart';
import 'package:logic_app/screens/settings.dart';
import 'package:logic_app/screens/statistics.dart';

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
              child: const PracticeScreen(),
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
              child: const ProgressScreen(),
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
          routes: [
            GoRoute(
              path: "statistics",
              builder: (context, state) => const StatisticsScreen(),
            ),
          ],
        ),
        GoRoute(
            path: "/competition",
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: const CompetitionScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.easeOutCirc)
                        .animate(animation),
                    child: child,
                  );
                },
              );
            },
            routes: [
              GoRoute(
                path: "leaderboard",
                builder: (context, state) => const LeaderboardScreen(),
              )
            ]),
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
    GoRoute(
        path: "/quiz",
        name: "quiz",
        //builder: (context, state) => const QuizScreen(),
        pageBuilder: (context, state) {
          var queryParameters = state.queryParameters;
          var quizMode = QuizMode.practice;
          if (queryParameters.containsKey("quiz_mode")) {
            var quizModeParam = queryParameters['quiz_mode'];
            switch (quizModeParam) {
              case "practice":
                quizMode = QuizMode.practice;
              case "competition":
                quizMode = QuizMode.competition;
            }
          }

          return CustomTransitionPage(
              child: QuizScreen(mode: quizMode),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeOutCirc).animate(animation),
                  child: child,
                );
              });
        }),
  ],
);
