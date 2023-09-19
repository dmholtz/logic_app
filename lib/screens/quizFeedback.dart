import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/quiz_config.dart';
import 'package:logic_app/models/quiz_lifecycle.dart';
import 'package:logic_app/state/current_quiz.dart';
import 'package:logic_app/state/practice.dart';
import 'package:logic_app/state/quiz_lifecycle.dart';
import 'package:logic_app/state/quiz_mode.dart';
import 'package:logic_app/state/quiz_timer.dart';
import 'package:logic_app/styles/quizLifecycleStyles.dart';

class QuizFeedbackScreen extends ConsumerWidget {
  const QuizFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget header = Text(
      switch (ref.watch(currentQuizProvider).isAnsweredCorrectly()) {
        false => "Wrong Answer!",
        true => "Congratulations!",
      },
      style: Theme.of(context).textTheme.headlineLarge,
    );

    Widget nextAction = switch (
        !ref.watch(currentQuizProvider).isAnsweredCorrectly() &&
            ref.watch(quizModeStateNotifierProvider) == QuizMode.practice) {
      true => ElevatedButton(
          child: const Text("Try again"),
          onPressed: () {
            ref.read(currentQuizProvider.notifier).resetQuiz();
            ref
                .read(quizLifecycleStateProvider.notifier)
                .setQuizLifecycleState(QuizLifecycleState.answering);
            if (ref.watch(isLimitedQuizTimeProvider)) {
              // Reset the countdownProvider when starting a new quiz
              // Source: https://pub.dev/documentation/riverpod/latest/riverpod/Ref/invalidate.html
              ref.invalidate(countdownProvider);
            }
          },
        ),
      false => ElevatedButton(
          child: const Text("Next"),
          onPressed: () {
            // TODO navigate to the next quiz
          },
        ),
    };

    Widget bottomRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: () {
              ref
                  .read(quizLifecycleStateProvider.notifier)
                  .setQuizLifecycleState(QuizLifecycleState.solution);
            },
            child: const Text(
              "Solution",
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: nextAction,
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 80),
      color: determineBackgroundColor(context, ref),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            header,
            bottomRow,
          ],
        ),
      ),
    );
  }
}
