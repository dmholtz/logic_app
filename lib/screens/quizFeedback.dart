import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/styles/quizLifecycleStyles.dart';

class QuizFeedbackScreen extends ConsumerWidget {
  const QuizFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: determineBackgroundColor(context, ref),
    );
  }
}
