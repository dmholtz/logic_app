import "package:freezed_annotation/freezed_annotation.dart";

part 'quiz_solved_submission.freezed.dart';
part 'quiz_solved_submission.g.dart';

@freezed
class QuizSolvedSubmission with _$QuizSolvedSubmission {
  const factory QuizSolvedSubmission({
    required int quizId,
    required bool isCorrect,
    double? time,
  }) = _QuizSolvedSubmission;

  factory QuizSolvedSubmission.fromJson(Map<String, Object?> json) =>
      _$QuizSolvedSubmissionFromJson(json);
}
