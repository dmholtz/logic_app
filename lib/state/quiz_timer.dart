import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/quiz_lifecycle.dart';
import 'package:logic_app/services/submit_answer.dart';
import 'package:logic_app/state/current_quiz.dart';
import 'package:logic_app/state/quiz_lifecycle.dart';

class QuizStartTimeStateNotifier extends StateNotifier<DateTime> {
  QuizStartTimeStateNotifier() : super(DateTime.now());

  void startQuizTime() {
    state = DateTime.now();
  }
}

final quizStartTimeStateNotifierProvider =
    StateNotifierProvider<QuizStartTimeStateNotifier, DateTime>(
  (ref) => QuizStartTimeStateNotifier(),
);

// use a StreamProvider to periodically update the countdown
// Source: https://pub.dev/documentation/riverpod/latest/riverpod/StreamProvider-class.html
final countdownProvider = StreamProvider<double>((ref) async* {
  var time = ref.watch(quizTimeLimitProvider);

  final stream =
      Stream.periodic(const Duration(milliseconds: 100), (i) => time - i * 0.1)
          .take(time * 10);

  yield time.toDouble();
  await for (final value in stream) {
    try {
      if (ref.watch(quizLifecycleStateProvider) !=
          QuizLifecycleState.answering) {
        break;
      }
    } catch (e) {
      break;
    }

    yield value;
  }
  try {
    if (ref.watch(quizLifecycleStateProvider) == QuizLifecycleState.answering) {
      submitAnswer(ref);
      ref
          .read(quizLifecycleStateProvider.notifier)
          .setQuizLifecycleState(QuizLifecycleState.feedback);
    }
  } catch (e) {
    // do nothing
  }
});
