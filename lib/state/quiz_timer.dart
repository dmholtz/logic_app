import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/quiz_lifecycle.dart';
import 'package:logic_app/state/practice.dart';
import 'package:logic_app/state/quiz_lifecycle.dart';

// use a StreamProvider to periodically update the countdown
// Source: https://pub.dev/documentation/riverpod/latest/riverpod/StreamProvider-class.html
final countdownProvider = StreamProvider<int>((ref) async* {
  var time = ref.watch(quizTimeProvider);

  final stream =
      Stream.periodic(const Duration(seconds: 1), (i) => time - i - 1)
          .take(time);

  yield time;
  await for (final value in stream) {
    if (ref.watch(quizLifecycleStateProvider) != QuizLifecycleState.answering) {
      break;
    }
    yield value;
  }
  if (ref.watch(quizLifecycleStateProvider) == QuizLifecycleState.answering) {
    ref
        .read(quizLifecycleStateProvider.notifier)
        .setQuizLifecycleState(QuizLifecycleState.feedback);
  }
});
