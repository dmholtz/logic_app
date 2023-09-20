enum QuizMode { practice, competition }

enum QuizType { sat, taut, equiv }

QuizType quizTypeFromString(String str) {
  return switch (str.toUpperCase()) {
    "SAT" => QuizType.sat,
    "TAUT" => QuizType.taut,
    "EQUIV" => QuizType.equiv,
    _ => throw Exception("Invalid quiz type"),
  };
}

enum Difficulty { easy, medium, hard }

const minQuizTime = 10; // seconds
const maxQuizTime = 60; // seconds
const quizTimeStep = 5; // seconds

const minNumVars = 2;
const maxNumVars = 6;

class QuizConfig {
  final QuizType quizType;
  final Difficulty difficulty;
  final int numVars;
  final int time;

  QuizConfig(
      {required this.quizType,
      required this.difficulty,
      required this.numVars,
      required this.time});

  QuizConfig updateQuizType(QuizType quizType) {
    return QuizConfig(
        quizType: quizType,
        difficulty: difficulty,
        numVars: numVars,
        time: time);
  }

  QuizConfig updateDifficulty(Difficulty difficulty) {
    return QuizConfig(
        quizType: quizType,
        difficulty: difficulty,
        numVars: numVars,
        time: time);
  }

  QuizConfig updateNumVars(int numVars) {
    return QuizConfig(
        quizType: quizType,
        difficulty: difficulty,
        numVars: numVars,
        time: time);
  }

  QuizConfig updateTime(int time) {
    return QuizConfig(
        quizType: quizType,
        difficulty: difficulty,
        numVars: numVars,
        time: time);
  }
}
