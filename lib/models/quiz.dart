import 'package:logic_app/models/possible_answer.dart';

abstract class Quiz {
  final String question;
  final QuizAnswerMode quizAnswerMode;
  final List<PossibleAnswer> possibleAnswers;

  Quiz({
    required this.question,
    required this.quizAnswerMode,
    required this.possibleAnswers,
  });

  bool isAnsweredCorrectly() {
    return possibleAnswers.every((pa) => pa.isSelected == pa.isCorrect);
  }
}

class SingleChoiceQuiz extends Quiz {
  final int? selectedId;

  SingleChoiceQuiz({
    required String question,
    required List<PossibleAnswer> possibleAnswers,
    this.selectedId,
  }) : super(
          question: question,
          quizAnswerMode: QuizAnswerMode.singleChoice,
          possibleAnswers: possibleAnswers,
        );

  Quiz selectAnswer(int id) {
    return SingleChoiceQuiz(
      question: question,
      possibleAnswers: possibleAnswers
          .map((pa) => pa.id == id
              ? pa.updateIsSelected(true)
              : pa.updateIsSelected(false))
          .toList(),
      selectedId: id,
    );
  }

  int? getSelectedId() {
    return selectedId;
  }
}

class MultipleChoiceQuiz extends Quiz {
  MultipleChoiceQuiz(
      {required String question, required List<PossibleAnswer> possibleAnswers})
      : super(
          question: question,
          quizAnswerMode: QuizAnswerMode.multipleChoice,
          possibleAnswers: possibleAnswers,
        );

  Quiz answerQuestion(int id, bool isSelected) {
    return MultipleChoiceQuiz(
      question: question,
      possibleAnswers: possibleAnswers
          .map((pa) => pa.id == id ? pa.updateIsSelected(isSelected) : pa)
          .toList(),
    );
  }
}
