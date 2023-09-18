import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:logic_app/models/achievement.dart';
import 'package:logic_app/styles/colors.dart';

// AwardTile is a rectangular tile with rounded borders
// Source: https://flutter-examples.com/flutter-create-rounded-corner-rectangle/
class AwardTile extends ConsumerWidget {
  final Achievement achievement;

  const AwardTile({super.key, required this.achievement});

  Color getTileBackgroundColor(BuildContext context) {
    if (achievement.achieved) {
      return Theme.of(context).colorScheme.primary;
    } else {
      return Theme.of(context).colorScheme.primaryContainer;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        achievement.achieved
            ? Icon(
                FontAwesome5.award,
                color: colorFromAchievementLevel(achievement.level),
                size: 30,
              )
            : const Icon(
                FontAwesome.question_circle_o,
                size: 30,
              ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: getTileBackgroundColor(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.name,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  achievement.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).colorScheme.surface),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
