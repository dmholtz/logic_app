import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logic_app/models/quiz_config.dart';
import 'package:logic_app/models/quiz_lifecycle.dart';
import 'package:logic_app/state/current_quiz.dart';
import 'package:logic_app/state/quiz_lifecycle.dart';
import 'package:logic_app/state/quiz_mode.dart';
import 'package:logic_app/state/quiz_solved_submission.dart';
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
            if (ref.watch(quizModeStateNotifierProvider) == QuizMode.practice) {
              context.goNamed("practice");
            } else {
              context.goNamed("competition");
            }
            //if (ref.watch(isLimitedQuizTimeProvider)) {
            //  // Reset the countdownProvider when starting a new quiz
            //  // Source: https://pub.dev/documentation/riverpod/latest/riverpod/Ref/invalidate.html
            //  ref.invalidate(countdownProvider);
            //}
//
            //// reset any previous quiz state
            //ref.read(currentQuizProvider.notifier).resetQuiz();
            //ref
            //    .read(quizLifecycleStateProvider.notifier)
            //    .setQuizLifecycleState(QuizLifecycleState.answering);
//
            //// fetch a new quiz and update the quiz state accordingly
            //transformRemoteToLocalQuiz(ref, context);
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
            ref.watch(quizSolvedSubmissionResponseProvider).when(
                  data: (data) {
                    if (ref.watch(quizModeStateNotifierProvider) ==
                        QuizMode.competition) {
                      return Text(
                        "You earn +${data.points} points!",
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      );
                    } else {
                      return const SizedBox(height: 0);
                    }
                  },
                  error: (error, stackTrace) => const Text(
                      "An error occured while submitting the answer to the server."),
                  loading: () => const CircularProgressIndicator(),
                ),
            bottomRow,
          ],
        ),
      ),
    );
  }
}
