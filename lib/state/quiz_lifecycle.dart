import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/quiz_lifecycle.dart';

class QuizLifecycleStateNotifier extends StateNotifier<QuizLifecycleState> {
  QuizLifecycleStateNotifier() : super(QuizLifecycleState.answering);

  void setQuizLifecycleState(QuizLifecycleState quizLifecycleState) {
    state = quizLifecycleState;
  }
}

final quizLifecycleStateProvider =
    StateNotifierProvider<QuizLifecycleStateNotifier, QuizLifecycleState>(
        (ref) => QuizLifecycleStateNotifier());
