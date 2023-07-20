import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final groupValueProvider = StateProvider<String>((ref) => "yes");

class SingleChoiceQuestion extends ConsumerWidget {
  final List<String> answers = ["yes", "no"];

  SingleChoiceQuestion({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: List.from(
        answers.map(
          (answer) {
            return RadioListTile(
              title: Text(answer),
              value: answer,
              groupValue: ref.watch(groupValueProvider),
              onChanged: (value) {
                //ref.read(groupValueProvider.notifier).change(value);
              },
              tileColor: Colors.lightGreen,
            );
          },
        ),
      ),
    );
  }
}
