import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/quiz_lifecycle.dart';
import 'package:logic_app/state/current_quiz.dart';
import 'package:logic_app/state/quiz_lifecycle.dart';
import 'package:logic_app/state/quiz_mode.dart';
import 'package:logic_app/state/quiz_timer.dart';
import 'package:logic_app/utils/quiz_transform.dart';
import 'package:logic_app/widgets/DifficultySelector.dart';
import 'package:logic_app/widgets/NumVariableSlider.dart';
import 'package:logic_app/widgets/QuizTypeSelector.dart';
import 'package:logic_app/widgets/TimerSlider.dart';

class PracticeScreen extends ConsumerWidget {
  const PracticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const QuizTypeSelector(),
              const DifficultySelector(),
              const NumVariableSlider(),
              const TimerSlider(),
              ElevatedButton(
                onPressed: () {
                  // set the quiz mode
                  ref
                      .read(quizModeStateNotifierProvider.notifier)
                      .setPractice();

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
                child: const Text('Reveal Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
