import 'package:logic_app/models/possible_answer.dart';
import 'package:logic_app/models/quiz_config.dart';

abstract class Quiz {
  final int quizId;
  final QuizType quizType;
  final int timeLimit;
  final String question;
  final QuizQuestionType quizAnswerMode;
  final List<PossibleAnswer> possibleAnswers;

  Quiz({
    required this.quizId,
    required this.quizType,
    required this.timeLimit,
    required this.question,
    required this.quizAnswerMode,
    required this.possibleAnswers,
  });

  bool isAnsweredCorrectly() {
    return possibleAnswers.every((pa) => pa.isSelected == pa.isCorrect);
  }

  Quiz resetQuiz();
}

class SingleChoiceQuiz extends Quiz {
  final int? selectedId;

  SingleChoiceQuiz({
    required int quizId,
    required QuizType quizType,
    required int timeLimit,
    required String question,
    required List<PossibleAnswer> possibleAnswers,
    this.selectedId,
  }) : super(
            quizId: quizId,
            quizType: quizType,
            timeLimit: timeLimit,
            question: question,
            quizAnswerMode: QuizQuestionType.singleChoice,
            possibleAnswers: possibleAnswers);

  Quiz selectAnswer(int id) {
    return SingleChoiceQuiz(
      quizId: quizId,
      quizType: quizType,
      timeLimit: timeLimit,
      question: question,
      possibleAnswers: possibleAnswers
          .map((pa) => pa.id == id
              ? pa.updateIsSelected(true)
              : pa.updateIsSelected(false))
          .toList(),
      selectedId: id,
    );
  }

  @override
  Quiz resetQuiz() {
    return SingleChoiceQuiz(
      quizId: quizId,
      quizType: quizType,
      timeLimit: timeLimit,
      question: question,
      possibleAnswers:
          possibleAnswers.map((pa) => pa.updateIsSelected(false)).toList(),
      selectedId: null,
    );
  }

  int? getSelectedId() {
    return selectedId;
  }
}

class MultipleChoiceQuiz extends Quiz {
  MultipleChoiceQuiz({
    required int quizId,
    required QuizType quizType,
    required int timeLimit,
    required String question,
    required List<PossibleAnswer> possibleAnswers,
  }) : super(
          quizId: quizId,
          quizType: quizType,
          timeLimit: timeLimit,
          question: question,
          quizAnswerMode: QuizQuestionType.multipleChoice,
          possibleAnswers: possibleAnswers,
        );

  Quiz answerQuestion(int id, bool isSelected) {
    return MultipleChoiceQuiz(
      quizId: quizId,
      quizType: quizType,
      timeLimit: timeLimit,
      question: question,
      possibleAnswers: possibleAnswers
          .map((pa) => pa.id == id ? pa.updateIsSelected(isSelected) : pa)
          .toList(),
    );
  }

  @override
  Quiz resetQuiz() {
    return MultipleChoiceQuiz(
      quizId: quizId,
      quizType: quizType,
      timeLimit: timeLimit,
      question: question,
      possibleAnswers:
          possibleAnswers.map((pa) => pa.updateIsSelected(false)).toList(),
    );
  }
}
