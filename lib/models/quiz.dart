import 'package:logic_app/models/possible_answer.dart';
import 'package:logic_app/models/quiz_config.dart';

abstract class Quiz {
  final String question;
  final QuizQuestionType quizAnswerMode;
  final List<PossibleAnswer> possibleAnswers;
  final QuizMode quizMode;

  Quiz({
    required this.question,
    required this.quizAnswerMode,
    required this.possibleAnswers,
    required this.quizMode,
  });

  bool isAnsweredCorrectly() {
    return possibleAnswers.every((pa) => pa.isSelected == pa.isCorrect);
  }

  Quiz resetQuiz();
}

class SingleChoiceQuiz extends Quiz {
  final int? selectedId;

  SingleChoiceQuiz({
    required String question,
    required List<PossibleAnswer> possibleAnswers,
    required QuizMode quizMode,
    this.selectedId,
  }) : super(
            question: question,
            quizAnswerMode: QuizQuestionType.singleChoice,
            possibleAnswers: possibleAnswers,
            quizMode: quizMode);

  Quiz selectAnswer(int id) {
    return SingleChoiceQuiz(
      question: question,
      possibleAnswers: possibleAnswers
          .map((pa) => pa.id == id
              ? pa.updateIsSelected(true)
              : pa.updateIsSelected(false))
          .toList(),
      quizMode: quizMode,
      selectedId: id,
    );
  }

  @override
  Quiz resetQuiz() {
    return SingleChoiceQuiz(
      question: question,
      possibleAnswers:
          possibleAnswers.map((pa) => pa.updateIsSelected(false)).toList(),
      quizMode: quizMode,
      selectedId: null,
    );
  }

  int? getSelectedId() {
    return selectedId;
  }
}

class MultipleChoiceQuiz extends Quiz {
  MultipleChoiceQuiz({
    required String question,
    required List<PossibleAnswer> possibleAnswers,
    required QuizMode quizMode,
  }) : super(
          question: question,
          quizAnswerMode: QuizQuestionType.multipleChoice,
          possibleAnswers: possibleAnswers,
          quizMode: quizMode,
        );

  Quiz answerQuestion(int id, bool isSelected) {
    return MultipleChoiceQuiz(
      question: question,
      possibleAnswers: possibleAnswers
          .map((pa) => pa.id == id ? pa.updateIsSelected(isSelected) : pa)
          .toList(),
      quizMode: quizMode,
    );
  }

  @override
  Quiz resetQuiz() {
    return MultipleChoiceQuiz(
      question: question,
      possibleAnswers:
          possibleAnswers.map((pa) => pa.updateIsSelected(false)).toList(),
      quizMode: quizMode,
    );
  }
}
