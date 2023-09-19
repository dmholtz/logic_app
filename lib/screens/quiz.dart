import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/possible_answer.dart';
import 'package:logic_app/models/quiz.dart';
import 'package:logic_app/models/quiz_config.dart';
import 'package:logic_app/models/quiz_lifecycle.dart';
import 'package:logic_app/state/current_quiz.dart';
import 'package:logic_app/state/practice.dart';
import 'package:logic_app/state/quiz_lifecycle.dart';
import 'package:logic_app/state/quiz_timer.dart';
import 'package:logic_app/styles/text.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> answerWidgets = List.empty();

    if (ref.watch(quizAnswerModeProvider) == QuizQuestionType.singleChoice) {
      answerWidgets = List.from(
        ref.watch(possibleAnswersProvider).map(
          (answer) {
            return RadioListTile(
                title: Text(answer.answer),
                value: answer.id,
                groupValue: (ref.watch(currentQuizProvider) as SingleChoiceQuiz)
                    .getSelectedId(),
                onChanged: (value) {
                  if (ref.watch(quizLifecycleStateProvider) ==
                      QuizLifecycleState.answering) {
                    var answeredQuiz =
                        (ref.read(currentQuizProvider) as SingleChoiceQuiz)
                            .selectAnswer(answer.id);
                    ref
                        .read(currentQuizProvider.notifier)
                        .setQuiz(answeredQuiz);
                  }
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
                if (ref.watch(quizLifecycleStateProvider) ==
                    QuizLifecycleState.answering) {
                  var answeredQuiz =
                      (ref.read(currentQuizProvider) as MultipleChoiceQuiz)
                          .answerQuestion(answer.id, value ?? false);
                  ref.read(currentQuizProvider.notifier).setQuiz(answeredQuiz);
                }
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
                .setQuizLifecycleState(QuizLifecycleState.feedback);
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
        ),
      QuizLifecycleState.feedback => Container(),
    };

    Widget? countdownWidget;
    if (ref.watch(quizTimeProvider) <= maxQuizTime) {
      AsyncValue<double> remainingTime = ref.watch(countdownProvider);

      remainingTime.when(
        loading: () {},
        data: (data) {
          countdownWidget = Text(
            "Remaining time: ${data.toStringAsFixed(1)}s",
            style: countdownTextStyle(context, ref, data),
          );
        },
        error: (Object error, StackTrace stackTrace) {},
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            ref.watch(questionTextProvider).toString(),
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          Text(
            ref.watch(questionProvider).toString(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            child: Column(
              children: answerWidgets,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 20),
              countdownWidget ?? const SizedBox.shrink(),
              const SizedBox(height: 20),
              bottomButton,
            ],
          ),
        ],
      ),
    );
  }
}
