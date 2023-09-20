import "package:freezed_annotation/freezed_annotation.dart";

part 'quiz_solved_submission_response.freezed.dart';
part 'quiz_solved_submission_response.g.dart';

@freezed
class QuizSolvedSubmissionResponse with _$QuizSolvedSubmissionResponse {
  const factory QuizSolvedSubmissionResponse({required int points}) =
      _QuizSolvedSubmissionResponse;

  factory QuizSolvedSubmissionResponse.fromJson(Map<String, Object?> json) =>
      _$QuizSolvedSubmissionResponseFromJson(json);
}
