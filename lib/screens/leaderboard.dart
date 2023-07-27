import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/state/players.dart';
import 'package:logic_app/widgets/leaderboard_entry.dart';

class LeaderboardScreen extends ConsumerWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(title: const Text("Leaderboard")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LeaderboardHeaderEntry(),
              const Divider(),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return LeaderboardEntry(
                          player: ref.watch(playersProvider)[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 15);
                    },
                    itemCount: ref.watch(playersProvider).length),
              ),
            ],
          ),
        ));
  }
}
