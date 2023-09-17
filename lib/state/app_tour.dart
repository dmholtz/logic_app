import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/app_tour_content.dart';

final appTourContentProvider = StateProvider<List<AppTourContent>>(
  (ref) => [
    const AppTourContent(
      title: "Your learning pace",
      description:
          "Choose between three types of quizzes: SAT, TAUT and EQUIV. Customize the level of difficulty in practice mode.",
      icon: Icon(
        Icons.access_time,
        size: 100,
      ),
    ),
    const AppTourContent(
      title: "Track your progress",
      description:
          "Earn awards for accomplishing milestones. Your level of expertise will increase with every quiz you solve.",
      icon: Icon(
        Icons.bar_chart,
        size: 100,
      ),
    ),
    const AppTourContent(
      title: "Need a challenge?",
      description:
          "Compete with other users in competition mode. Better be quick, you only have limited time to answer each question.",
      icon: Icon(
        Icons.people,
        size: 100,
      ),
    ),
    const AppTourContent(
      title: "Get started",
      description:
          "Finish the app tour and start practicing. You can always come back to the app tour in the settings.",
      icon: Icon(
        Icons.golf_course,
        size: 100,
      ),
    ),
  ],
);

class AppTourActiveCardNotifier extends StateNotifier<int> {
  final int numberOfCards;
  AppTourActiveCardNotifier(this.numberOfCards) : super(0);

  void setActiveCard(int index) {
    state = index;
  }

  void nextCard() {
    state = (state + 1) % numberOfCards;
  }
}

final currentAppTourCardProvider =
    StateNotifierProvider<AppTourActiveCardNotifier, int>((ref) =>
        AppTourActiveCardNotifier(ref.watch(appTourContentProvider).length));

class AppTourSeenStateNotifier extends StateNotifier<bool> {
  AppTourSeenStateNotifier() : super(false);

  void setAppTourSeen() {
    state = true;
  }
}

final appTourSeenProvider =
    StateNotifierProvider<AppTourSeenStateNotifier, bool>(
  (ref) => AppTourSeenStateNotifier(),
);
