import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/possible_answer.dart';
import 'package:logic_app/models/quiz.dart';

class CurrentQuizStateNotifier extends StateNotifier<Quiz> {
  CurrentQuizStateNotifier(super.state);

  void setQuiz(Quiz quiz) {
    state = quiz;
  }
}

final currentQuizProvider =
    StateNotifierProvider<CurrentQuizStateNotifier, Quiz>(
  (ref) => CurrentQuizStateNotifier(
    MultipleChoiceQuiz(
      question: "Which are equivalent?",
      possibleAnswers: [
        PossibleAnswer(id: 0, answer: "A", isCorrect: true),
        PossibleAnswer(id: 1, answer: "B", isCorrect: false),
        PossibleAnswer(id: 2, answer: "C", isCorrect: true),
        PossibleAnswer(id: 3, answer: "D", isCorrect: true),
      ],
    ),
  ),
);

final questionProvider = Provider<String>((ref) {
  return ref.watch(currentQuizProvider).question;
});

final quizAnswerModeProvider = Provider<QuizAnswerMode>((ref) {
  return ref.watch(currentQuizProvider).quizAnswerMode;
});

final possibleAnswersProvider = Provider<List<PossibleAnswer>>((ref) {
  return ref.watch(currentQuizProvider).possibleAnswers;
});
