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
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "You only have limited time to answer each question. Are you ready?",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    context.goNamed('quiz',
                        queryParameters: {"quiz_mode": "competition"});
                  },
                  // create a circular elevated button:
                  // Source: https://www.fluttercampus.com/guide/290/border-radius-circular-elevated-button/
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text("Start"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
