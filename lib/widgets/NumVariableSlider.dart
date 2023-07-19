import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/quiz_config.dart';
import 'package:logic_app/state/practice.dart';

class NumVariableSlider extends ConsumerWidget {
  const NumVariableSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Variables",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(ref.watch(numVarsProvider).toString())
          ],
        ),
        const SizedBox(height: 25),
        Slider(
          min: minNumVars.toDouble(),
          max: maxNumVars.toDouble(),
          divisions: maxNumVars - minNumVars,
          label: ref.watch(numVarsProvider).toString(),
          value: ref.watch(numVarsProvider).toDouble(),
          onChanged: (newNumVars) {
            ref
                .read(quizConfigProvider.notifier)
                .setNumVars(newNumVars.toInt());
          },
        ),
      ],
    );
  }
}
