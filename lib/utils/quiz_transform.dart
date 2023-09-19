import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logic_app/models/possible_answer.dart';
import 'package:logic_app/models/quiz.dart';
import 'package:logic_app/models/quiz_config.dart';
import 'package:logic_app/state/current_quiz.dart';
import 'package:logic_app/state/quiz_mode.dart';
import 'package:logic_app/state/remote_quiz.dart';
import 'package:logic_app/widgets/offline_snackbar.dart';

// Decouples the asynchronous fetching of quizzes from the remote server and
// the synchronous access to the current quiz state.
void transformRemoteToLocalQuiz(WidgetRef ref, BuildContext context) async {
  try {
    var remoteQuiz = await ref.read(remoteQuizProvider.future);
    var quizType = quizTypeFromString(remoteQuiz.type);
    var possibleAnswers = List.generate(
      remoteQuiz.answers.length,
      (idx) => PossibleAnswer(
          id: idx,
          answer: remoteQuiz.answers[idx],
          isCorrect: remoteQuiz.solutions[idx]),
    );

    Quiz quiz = switch (quizType) {
      QuizType.sat || QuizType.taut => SingleChoiceQuiz(
          quizType: quizType,
          question: remoteQuiz.question,
          possibleAnswers: possibleAnswers,
        ),
      QuizType.equiv => MultipleChoiceQuiz(
          quizType: quizType,
          question: remoteQuiz.question,
          possibleAnswers: possibleAnswers,
        )
    };
    ref.read(currentQuizProvider.notifier).setQuiz(quiz);

    // navigate to the quiz screen of the appropriate mode
    if (context.mounted) {
      if (ref.watch(quizModeStateNotifierProvider) == QuizMode.practice) {
        context.goNamed('quiz', queryParameters: {"mode": "practice"});
      } else {
        context.goNamed('quiz', queryParameters: {"mode": "competition"});
      }
    }
  } catch (e) {
    // show snackbar in case of any errors
    ScaffoldMessenger.of(context).showSnackBar(offlineSnackbar);
  }
}
