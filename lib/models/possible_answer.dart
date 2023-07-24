enum QuizQuestionType { singleChoice, multipleChoice }

class PossibleAnswer {
  final int id;
  final String answer;
  final bool isCorrect;
  final bool isSelected;

  PossibleAnswer({
    required this.id,
    required this.answer,
    required this.isCorrect,
    this.isSelected = false,
  });

  PossibleAnswer updateIsSelected(bool value) {
    return PossibleAnswer(
        id: id, answer: answer, isCorrect: isCorrect, isSelected: value);
  }

  bool isAnsweredCorrectly() {
    return isSelected == isCorrect;
  }
}
