import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logic_app/models/quiz_lifecycle.dart';
import 'package:logic_app/state/current_quiz.dart';
import 'package:logic_app/state/leaderboard.dart';
import 'package:logic_app/state/quiz_lifecycle.dart';
import 'package:logic_app/state/quiz_mode.dart';
import 'package:logic_app/state/quiz_timer.dart';
import 'package:logic_app/utils/quiz_transform.dart';

class CompetitionScreen extends ConsumerWidget {
  const CompetitionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Competition Mode"),
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(leaderboardEntriesProvider);
                context.push("/competition/leaderboard");
              },
              icon: const Icon(Icons.format_list_numbered))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "You only have limited time to answer each question. Are you ready?",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    // set the quiz mode
                    ref
                        .read(quizModeStateNotifierProvider.notifier)
                        .setCompetition();

                    // fetch a new quiz and update the quiz state accordingly
                    transformRemoteToLocalQuiz(ref, context);

                    if (ref.watch(isLimitedQuizTimeProvider)) {
                      // Reset the countdownProvider when starting a new quiz
                      // Source: https://pub.dev/documentation/riverpod/latest/riverpod/Ref/invalidate.html
                      ref.invalidate(countdownProvider);
                    }

                    // reset any previous quiz state
                    ref.read(currentQuizProvider.notifier).resetQuiz();
                    ref
                        .read(quizLifecycleStateProvider.notifier)
                        .setQuizLifecycleState(QuizLifecycleState.answering);

                    // start the quiz timer
                    ref
                        .read(quizStartTimeStateNotifierProvider.notifier)
                        .startQuizTime();
                  },
                  // create a circular elevated button:
                  // Source: https://www.fluttercampus.com/guide/290/border-radius-circular-elevated-button/
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text("Start"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
