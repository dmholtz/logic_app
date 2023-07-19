import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/quiz_config.dart';
import 'package:logic_app/state/practice.dart';

class TimerSlider extends ConsumerWidget {
  const TimerSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Timer",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(ref.watch(quizTimeStringProvider)),
          ],
        ),
        const SizedBox(height: 25),
        Slider(
          divisions: ((maxQuizTime - minQuizTime) / quizTimeStep + 1).toInt(),
          label: ref.watch(quizTimeSliderLabelProvider),
          value: ref.watch(quizTimeSliderValueProvider),
          onChanged: (newSliderValue) {
            var newTime = minQuizTime +
                (maxQuizTime - minQuizTime + quizTimeStep) * newSliderValue;
            ref.read(quizConfigProvider.notifier).setTime(newTime.toInt());
          },
        ),
      ],
    );
  }
}
