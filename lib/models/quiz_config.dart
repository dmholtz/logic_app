enum Difficulty { easy, medium, hard }

enum QuizType { sat, taut, equiv }

const minQuizTime = 10; // seconds
const maxQuizTime = 60; // seconds
const quizTimeStep = 5; // seconds

const minNumVars = 1;
const maxNumVars = 5;

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
