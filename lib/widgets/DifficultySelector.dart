import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/quiz_config.dart';
import 'package:logic_app/state/practice.dart';

class DifficultySelector extends ConsumerWidget {
  const DifficultySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Difficulty",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: SegmentedButton<Difficulty>(
            segments: const [
              ButtonSegment<Difficulty>(
                value: Difficulty.easy,
                label: Text("easy"),
              ),
              ButtonSegment<Difficulty>(
                value: Difficulty.medium,
                label: Text("medium"),
              ),
              ButtonSegment<Difficulty>(
                value: Difficulty.hard,
                label: Text("hard"),
              )
            ],
            selected: <Difficulty>{ref.watch(difficultyProvider)},
            onSelectionChanged: (newSelection) => {
              ref
                  .read(quizConfigProvider.notifier)
                  .setDifficulty(newSelection.first)
            },
          ),
        ),
      ],
    );
  }
}
