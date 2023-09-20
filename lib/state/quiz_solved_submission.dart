import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:logic_app/models/quiz_solved_submission.dart';
import 'package:logic_app/models/quiz_solved_submission_response.dart';
import 'package:logic_app/state/access_token.dart';

class QuizSolvedSubmissionStateNotifer
    extends StateNotifier<QuizSolvedSubmission> {
  QuizSolvedSubmissionStateNotifer(super.state);

  void updateSubmission(QuizSolvedSubmission submission) {
    state = submission;
  }
}

final quizSolvedSubmissionStateNotiferProvider = StateNotifierProvider<
    QuizSolvedSubmissionStateNotifer, QuizSolvedSubmission>(
  (ref) => QuizSolvedSubmissionStateNotifer(const QuizSolvedSubmission(
    quizId: 0,
    isCorrect: false,
    time: 0,
  )),
);

final quizSolvedSubmissionResponseProvider =
    FutureProvider<QuizSolvedSubmissionResponse>(
  (ref) {
    String url = "https://localhost:443/quiz/solve";

    return ref.watch(bearerAccessTokenProvider).then((token) {
      var response = http.post(
        Uri.parse(url),
        headers: {"Authorization": token},
        body: jsonEncode(ref.watch(quizSolvedSubmissionStateNotiferProvider)),
      );
      print("submitting answer");
      return response.then((data) {
        if (data.statusCode != 200) {
          throw Exception("Failed to submit answer to the server");
        }
        var json = jsonDecode(data.body);
        return QuizSolvedSubmissionResponse.fromJson(json);
      });
    });
  },
);
