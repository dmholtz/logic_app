import 'package:logic_app/models/possible_answer.dart';
import 'package:logic_app/models/quiz_config.dart';

abstract class Quiz {
  final QuizType quizType;
  final String question;
  final QuizQuestionType quizAnswerMode;
  final List<PossibleAnswer> possibleAnswers;

  Quiz({
    required this.quizType,
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
    required QuizType quizType,
    required String question,
    required List<PossibleAnswer> possibleAnswers,
    this.selectedId,
  }) : super(
            quizType: quizType,
            question: question,
            quizAnswerMode: QuizQuestionType.singleChoice,
            possibleAnswers: possibleAnswers);

  Quiz selectAnswer(int id) {
    return SingleChoiceQuiz(
      quizType: quizType,
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
      quizType: quizType,
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
    required QuizType quizType,
    required String question,
    required List<PossibleAnswer> possibleAnswers,
  }) : super(
          quizType: quizType,
          question: question,
          quizAnswerMode: QuizQuestionType.multipleChoice,
          possibleAnswers: possibleAnswers,
        );

  Quiz answerQuestion(int id, bool isSelected) {
    return MultipleChoiceQuiz(
      quizType: quizType,
      question: question,
      possibleAnswers: possibleAnswers
          .map((pa) => pa.id == id ? pa.updateIsSelected(isSelected) : pa)
          .toList(),
    );
  }

  @override
  Quiz resetQuiz() {
    return MultipleChoiceQuiz(
      quizType: quizType,
      question: question,
      possibleAnswers:
          possibleAnswers.map((pa) => pa.updateIsSelected(false)).toList(),
    );
  }
}
