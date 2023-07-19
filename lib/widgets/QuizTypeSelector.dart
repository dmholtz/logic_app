import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/quiz_config.dart';
import 'package:logic_app/state/practice.dart';

class QuizTypeSelector extends ConsumerWidget {
  const QuizTypeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Quiz Type",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: SegmentedButton<QuizType>(
            segments: const [
              ButtonSegment<QuizType>(
                value: QuizType.sat,
                label: Text("SAT"),
              ),
              ButtonSegment<QuizType>(
                value: QuizType.taut,
                label: Text("TAUT"),
              ),
              ButtonSegment<QuizType>(
                value: QuizType.equiv,
                label: Text("EQUIV"),
              ),
            ],
            selected: <QuizType>{ref.watch(quizTypeProvider)},
            onSelectionChanged: (newSelection) => {
              ref
                  .read(quizConfigProvider.notifier)
                  .setQuizType(newSelection.first)
            },
          ),
        ),
      ],
    );
  }
}
