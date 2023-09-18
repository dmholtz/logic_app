import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/state/leaderboard.dart';
import 'package:logic_app/widgets/leaderboard_entry.dart';

class LeaderboardScreen extends ConsumerWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var leaderboard = ref.watch(leaderboardEntriesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Leaderboard")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LeaderboardHeaderWidget(),
            const Divider(),
            leaderboard.when(data: (data) {
              return Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return LeaderboardEntryWidget(
                          player: data[index], rank: index + 1);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 15);
                    },
                    itemCount: data.length),
              );
            }, loading: () {
              return const Expanded(
                child: Center(child: CircularProgressIndicator()),
              );
            }, error: (error, stackTrace) {
              return const Expanded(
                child: Center(child: Text("An unexpected error occured.")),
              );
            }),
          ],
        ),
      ),
    );
  }
}
