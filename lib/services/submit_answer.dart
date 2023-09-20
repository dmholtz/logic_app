import 'dart:math';

import 'package:logic_app/models/quiz_solved_submission.dart';
import 'package:logic_app/state/current_quiz.dart';
import 'package:logic_app/state/quiz_solved_submission.dart';
import 'package:logic_app/state/quiz_timer.dart';

void submitAnswer(dynamic ref) {
  int elapsedMilliseconds = DateTime.now()
      .difference(ref.watch(quizStartTimeStateNotifierProvider))
      .inMilliseconds;
  int timeLimit = ref.watch(quizTimeLimitProvider);

  var isCorrect = ref.watch(currentQuizProvider).isAnsweredCorrectly();

  var submission = QuizSolvedSubmission(
    quizId: ref.watch(currentQuizProvider).quizId,
    isCorrect: isCorrect,
    time: isCorrect
        ? min(elapsedMilliseconds / 1000.0, timeLimit.toDouble())
        : null,
  );

  ref
      .read(quizSolvedSubmissionStateNotiferProvider.notifier)
      .updateSubmission(submission);
}
