import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logic_app/models/possible_answer.dart';
import 'package:logic_app/models/quiz.dart';
import 'package:logic_app/models/quiz_config.dart';
import 'package:logic_app/models/quiz_lifecycle.dart';
import 'package:logic_app/state/current_quiz.dart';
import 'package:logic_app/state/quiz_lifecycle.dart';

class QuizScreen extends ConsumerWidget {
  final QuizMode mode;

  const QuizScreen({required this.mode, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> answerWidgets = List.empty();

    if (ref.watch(quizAnswerModeProvider) == QuizAnswerMode.singleChoice) {
      answerWidgets = List.from(
        ref.watch(possibleAnswersProvider).map(
          (answer) {
            return RadioListTile(
                title: Text(answer.answer),
                value: answer.id,
                groupValue: (ref.watch(currentQuizProvider) as SingleChoiceQuiz)
                    .getSelectedId(),
                onChanged: (value) {
                  var answeredQuiz =
                      (ref.read(currentQuizProvider) as SingleChoiceQuiz)
                          .selectAnswer(answer.id);
                  ref.read(currentQuizProvider.notifier).setQuiz(answeredQuiz);
                },
                tileColor: ref.watch(quizLifecycleStateProvider) ==
                        QuizLifecycleState.solution
                    ? answer.isAnsweredCorrectly()
                        ? Colors.green
                        : Colors.red
                    : Theme.of(context).canvasColor);
          },
        ),
      );
    } else {
      answerWidgets = List.from(
        ref.watch(possibleAnswersProvider).map(
          (answer) {
            return CheckboxListTile(
              title: Text(answer.answer),
              value: answer.isSelected,
              onChanged: (value) {
                var answeredQuiz =
                    (ref.read(currentQuizProvider) as MultipleChoiceQuiz)
                        .answerQuestion(answer.id, value ?? false);
                ref.read(currentQuizProvider.notifier).setQuiz(answeredQuiz);
              },
              tileColor: ref.watch(quizLifecycleStateProvider) ==
                      QuizLifecycleState.solution
                  ? answer.isAnsweredCorrectly()
                      ? Colors.green
                      : Colors.red
                  : Theme.of(context).canvasColor,
            );
          },
        ),
      );
    }

    Widget bottomButton = switch (ref.watch(quizLifecycleStateProvider)) {
      QuizLifecycleState.answering => ElevatedButton(
          onPressed: () {
            ref
                .read(quizLifecycleStateProvider.notifier)
                .setQuizLifecycleState(QuizLifecycleState.solution);
          },
          child: const Text("Submit"),
        ),
      QuizLifecycleState.solution => ElevatedButton(
          onPressed: () {
            ref
                .read(quizLifecycleStateProvider.notifier)
                .setQuizLifecycleState(QuizLifecycleState.answering);
          },
          child: const Text("Next"),
        )
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(ref.watch(questionProvider).toString()),
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: Column(
                children: answerWidgets,
              ),
            ),
            const SizedBox(height: 20),
            bottomButton,
          ],
        ),
      ),
    );
  }
}