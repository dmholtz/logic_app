import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logic_app/state/learning_progress.dart';
import 'package:logic_app/widgets/award_tile.dart';
import 'package:logic_app/widgets/star_progress_indicator.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning Progress"),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/progress/statistics');
            },
            icon: const Icon(Icons.percent_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your Level",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                StarProgressIndicator(value: 0.53),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Achievements",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "7/10",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return AwardTile(award: ref.watch(awardsProvider)[index]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
