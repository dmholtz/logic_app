import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/quiz_config.dart';

class QuizModeStateNotifier extends StateNotifier<QuizMode> {
  QuizModeStateNotifier() : super(QuizMode.practice);

  void setPractice() {
    state = QuizMode.practice;
  }

  void setCompetition() {
    state = QuizMode.competition;
  }
}

final quizModeStateNotifierProvider =
    StateNotifierProvider<QuizModeStateNotifier, QuizMode>(
  (ref) => QuizModeStateNotifier(),
);
