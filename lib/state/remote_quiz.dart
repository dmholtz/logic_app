import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:logic_app/models/quiz_config.dart';
import 'package:logic_app/models/remote_quiz.dart';
import 'package:logic_app/state/access_token.dart';
import 'package:logic_app/state/practice.dart';
import 'package:logic_app/state/quiz_mode.dart';

final remoteQuizProvider = FutureProvider<RemoteQuiz>(
  (ref) {
    QuizMode mode = ref.watch(quizModeStateNotifierProvider);

    // build URL based on quiz mode and quiz config
    String url = "https://localhost:443/quiz";
    if (mode == QuizMode.practice) {
      QuizConfig qc = ref.watch(quizConfigProvider);
      url += "/find";
      url +=
          "?type=${qc.quizType.name}&difficulty=${qc.difficulty.name}&numVars=${qc.numVars}&timeLimit=${qc.time}";
    } else {
      url += "/competition";
    }

    return ref.watch(bearerAccessTokenProvider).then((token) {
      var response = http.get(
        Uri.parse(url),
        headers: {"Authorization": token},
      );
      return response.then((data) {
        if (data.statusCode != 200) {
          throw Exception("Failed to load quiz");
        }
        var json = jsonDecode(data.body);
        return RemoteQuiz.fromJson(json);
      });
    });
  },
);
