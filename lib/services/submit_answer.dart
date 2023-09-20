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

  //ref.watch(bearerAccessTokenProvider).then((token) {
  //    var response = http.get(
  //      Uri.parse(url),
  //      headers: {"Authorization": token},
  //    );
  //    return response.then((data) {
  //      if (data.statusCode != 200) {
  //        throw Exception("Failed to load quiz");
  //      }
  //      var json = jsonDecode(data.body);
  //      return RemoteQuiz.fromJson(json);
  //    });
  //  });
//
  //http.post(
  //  Uri.parse('https://localhost:443/quiz/solve'),
  //  headers: <String, String>{
  //    'Content-Type': 'application/json; charset=UTF-8',
  //  },
  //  body: jsonEncode(submission.toJson()),
  //);
}
