// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RemoteQuiz _$$_RemoteQuizFromJson(Map<String, dynamic> json) =>
    _$_RemoteQuiz(
      quizId: json['quizId'] as int,
      type: json['type'] as String,
      timeLimit: (json['timeLimit'] as num).toDouble(),
      question: json['question'] as String,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      solutions:
          (json['solutions'] as List<dynamic>).map((e) => e as bool).toList(),
    );

Map<String, dynamic> _$$_RemoteQuizToJson(_$_RemoteQuiz instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'type': instance.type,
      'timeLimit': instance.timeLimit,
      'question': instance.question,
      'answers': instance.answers,
      'solutions': instance.solutions,
    };
