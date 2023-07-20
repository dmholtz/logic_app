import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CompetitionScreen extends ConsumerWidget {
  const CompetitionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Competition Mode"),
        actions: [
          IconButton(
              onPressed: () {
                context.push("/competition/leaderboard");
              },
              icon: const Icon(Icons.format_list_numbered))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                context
                    .goNamed('quiz', queryParameters: {"mode": "competition"});
              },
              child: const Text("Start"),
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/competition/leaderboard');
              },
              child: const Text("Leaderboard"),
            ),
          ],
        ),
      ),
    );
  }
}
