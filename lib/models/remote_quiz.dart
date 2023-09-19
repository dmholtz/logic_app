import "package:freezed_annotation/freezed_annotation.dart";

part 'remote_quiz.freezed.dart';
part 'remote_quiz.g.dart';

@freezed
class RemoteQuiz with _$RemoteQuiz {
  const factory RemoteQuiz({
    required int quizId,
    required String type,
    required double timeLimit,
    required String question,
    required List<String> answers,
    required List<bool> solutions,
  }) = _RemoteQuiz;

  factory RemoteQuiz.fromJson(Map<String, Object?> json) =>
      _$RemoteQuizFromJson(json);
}
