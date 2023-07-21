import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/quiz_lifecycle.dart';
import 'package:logic_app/state/current_quiz.dart';
import 'package:logic_app/state/quiz_lifecycle.dart';

Color determineBackgroundColor(BuildContext context, WidgetRef ref) {
  switch (ref.watch(quizLifecycleStateProvider)) {
    case QuizLifecycleState.answering:
      return Theme.of(context).canvasColor;
    case QuizLifecycleState.solution:
      if (ref.watch(currentQuizProvider).isAnsweredCorrectly()) {
        return Colors.lightGreen;
      } else {
        return Colors.redAccent;
      }
  }
}
