// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_solved_submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizSolvedSubmission _$$_QuizSolvedSubmissionFromJson(
        Map<String, dynamic> json) =>
    _$_QuizSolvedSubmission(
      quizId: json['quizId'] as int,
      isCorrect: json['isCorrect'] as bool,
      time: (json['time'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_QuizSolvedSubmissionToJson(
        _$_QuizSolvedSubmission instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'isCorrect': instance.isCorrect,
      'time': instance.time,
    };
