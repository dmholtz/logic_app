import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                  //ref.read(settingsProvider.notifier).increment();
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
