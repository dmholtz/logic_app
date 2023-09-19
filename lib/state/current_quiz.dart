import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/possible_answer.dart';
import 'package:logic_app/models/quiz.dart';
import 'package:logic_app/models/quiz_config.dart';

class CurrentQuizStateNotifier extends StateNotifier<Quiz> {
  CurrentQuizStateNotifier(super.state);

  void setQuiz(Quiz quiz) {
    state = quiz;
  }

  void resetQuiz() {
    state = state.resetQuiz();
  }
}

final currentQuizProvider =
    StateNotifierProvider<CurrentQuizStateNotifier, Quiz>(
  (ref) => CurrentQuizStateNotifier(
    SingleChoiceQuiz(
      quizType: QuizType.taut,
      question: "A | !A",
      possibleAnswers: [
        PossibleAnswer(id: 0, answer: "Yes", isCorrect: true),
        PossibleAnswer(id: 1, answer: "No", isCorrect: false),
      ],
    ),
  ),
);

final questionProvider = Provider<String>((ref) {
  return ref.watch(currentQuizProvider).question;
});

final questionTextProvider = Provider<String>((ref) {
  return switch (ref.watch(currentQuizProvider).quizType) {
    QuizType.sat => "Is this formula satisfiable?",
    QuizType.taut => "Is this formula a tautology?",
    QuizType.equiv =>
      "Which of the formulas below is equivalent to this formula?",
  };
});

final quizAnswerModeProvider = Provider<QuizQuestionType>((ref) {
  return ref.watch(currentQuizProvider).quizAnswerMode;
});

final possibleAnswersProvider = Provider<List<PossibleAnswer>>((ref) {
  return ref.watch(currentQuizProvider).possibleAnswers;
});
