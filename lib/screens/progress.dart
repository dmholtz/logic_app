import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/state/achievement.dart';
import 'package:logic_app/widgets/award_tile.dart';
import 'package:logic_app/widgets/star_progress_indicator.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var achievements = ref.watch(achievementsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Learning Progress"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: achievements.when(
          data: (achievements) {
            var numAchieved =
                achievements.where((element) => element.achieved).length;
            var numTotal = achievements.length;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Achievements ($numAchieved/$numTotal)",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    StarProgressIndicator(value: numAchieved / numTotal),
                  ],
                ),
                const Divider(),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: achievements.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AwardTile(achievement: achievements[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 10),
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) =>
              const Center(child: Text("An unexpected error occured.")),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
