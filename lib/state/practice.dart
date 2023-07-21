import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/models/quiz_config.dart';

class PracticeModeConfigNotifier extends StateNotifier<QuizConfig> {
  PracticeModeConfigNotifier()
      : super(QuizConfig(
            quizType: QuizType.sat,
            difficulty: Difficulty.easy,
            numVars: 2,
            time: maxQuizTime + quizTimeStep));

  void setQuizType(QuizType quizType) {
    state = state.updateQuizType(quizType);
  }

  void setDifficulty(Difficulty difficulty) {
    state = state.updateDifficulty(difficulty);
  }

  void setNumVars(int numVars) {
    state = state.updateNumVars(numVars);
  }

  void setTime(int time) {
    state = state.updateTime(time);
  }
}

final quizConfigProvider =
    StateNotifierProvider<PracticeModeConfigNotifier, QuizConfig>(
  (ref) => PracticeModeConfigNotifier(),
);

final quizTypeProvider =
    Provider<QuizType>((ref) => ref.watch(quizConfigProvider).quizType);

final difficultyProvider =
    Provider<Difficulty>((ref) => ref.watch(quizConfigProvider).difficulty);

final numVarsProvider =
    Provider<int>((ref) => ref.watch(quizConfigProvider).numVars);

final quizTimeProvider =
    Provider<int>((ref) => ref.watch(quizConfigProvider).time);

final isLimitedQuizTimeProvider = Provider<bool>((ref) {
  return ref.watch(quizTimeProvider) <= maxQuizTime;
});

// maps quizTimeProvider to a value between 0 and 1 for the slider
final quizTimeSliderValueProvider = Provider<double>((ref) {
  if (ref.watch(quizTimeProvider) > maxQuizTime) {
    return 1;
  } else {
    return (ref.watch(quizTimeProvider) - minQuizTime) /
        (maxQuizTime - minQuizTime + quizTimeStep);
  }
});

// maps quizTimeProvider to a string for the slider label
final quizTimeSliderLabelProvider = Provider<String>((ref) {
  if (ref.watch(quizTimeProvider) > maxQuizTime) {
    return "∞";
  } else {
    return "${ref.watch(quizTimeProvider)}";
  }
});

// maps quizTimeProvider to a string descriptor for the selected time
final quizTimeStringProvider = Provider<String>((ref) {
  if (ref.watch(quizTimeProvider) > maxQuizTime) {
    return "no timeout";
  } else {
    return "${ref.watch(quizTimeProvider)} seconds";
  }
});
