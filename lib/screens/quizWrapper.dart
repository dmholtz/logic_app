import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logic_app/models/quiz_config.dart';
import 'package:logic_app/models/quiz_lifecycle.dart';
import 'package:logic_app/screens/quiz.dart';
import 'package:logic_app/screens/quizFeedback.dart';
import 'package:logic_app/state/quiz_lifecycle.dart';
import 'package:logic_app/styles/quizLifecycleStyles.dart';

class QuizWrapperScreen extends ConsumerWidget {
  final QuizMode mode;

  const QuizWrapperScreen({required this.mode, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget title;
    Widget body;
    switch (ref.watch(quizLifecycleStateProvider)) {
      case QuizLifecycleState.answering:
        title = const Text("Quiz");
        body = const QuizScreen();
        break;
      case QuizLifecycleState.feedback:
        title = const Text("");
        body = const QuizFeedbackScreen();
        break;
      case QuizLifecycleState.solution:
        title = const Text("Solution");
        body = const QuizScreen();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: title,
        backgroundColor: determineBackgroundColor(context, ref),
        actions: [
          IconButton(
            onPressed: () {
              switch (mode) {
                case QuizMode.practice:
                  context.go('/practice');
                  break;
                case QuizMode.competition:
                  context.go('/competition');
                  break;
              }
            },
            icon: const Icon(Icons.close_outlined),
          ),
        ],
      ),
      body: body,
    );
  }
}
