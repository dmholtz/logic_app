import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logic_app/state/practice.dart';
import 'package:logic_app/state/quiz_timer.dart';
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
                  if (ref.watch(isLimitedQuizTimeProvider)) {
                    // Reset the countdownProvider when starting a new quiz
                    // Source: https://pub.dev/documentation/riverpod/latest/riverpod/Ref/invalidate.html
                    ref.invalidate(countdownProvider);
                  }
                  context
                      .goNamed('quiz', queryParameters: {"mode": "practice"});
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
