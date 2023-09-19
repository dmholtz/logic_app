// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RemoteQuiz _$RemoteQuizFromJson(Map<String, dynamic> json) {
  return _RemoteQuiz.fromJson(json);
}

/// @nodoc
mixin _$RemoteQuiz {
  int get quizId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get timeLimit => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;
  List<bool> get solutions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteQuizCopyWith<RemoteQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteQuizCopyWith<$Res> {
  factory $RemoteQuizCopyWith(
          RemoteQuiz value, $Res Function(RemoteQuiz) then) =
      _$RemoteQuizCopyWithImpl<$Res, RemoteQuiz>;
  @useResult
  $Res call(
      {int quizId,
      String type,
      double timeLimit,
      String question,
      List<String> answers,
      List<bool> solutions});
}

/// @nodoc
class _$RemoteQuizCopyWithImpl<$Res, $Val extends RemoteQuiz>
    implements $RemoteQuizCopyWith<$Res> {
  _$RemoteQuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? type = null,
    Object? timeLimit = null,
    Object? question = null,
    Object? answers = null,
    Object? solutions = null,
  }) {
    return _then(_value.copyWith(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      timeLimit: null == timeLimit
          ? _value.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as double,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      solutions: null == solutions
          ? _value.solutions
          : solutions // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RemoteQuizCopyWith<$Res>
    implements $RemoteQuizCopyWith<$Res> {
  factory _$$_RemoteQuizCopyWith(
          _$_RemoteQuiz value, $Res Function(_$_RemoteQuiz) then) =
      __$$_RemoteQuizCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int quizId,
      String type,
      double timeLimit,
      String question,
      List<String> answers,
      List<bool> solutions});
}

/// @nodoc
class __$$_RemoteQuizCopyWithImpl<$Res>
    extends _$RemoteQuizCopyWithImpl<$Res, _$_RemoteQuiz>
    implements _$$_RemoteQuizCopyWith<$Res> {
  __$$_RemoteQuizCopyWithImpl(
      _$_RemoteQuiz _value, $Res Function(_$_RemoteQuiz) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? type = null,
    Object? timeLimit = null,
    Object? question = null,
    Object? answers = null,
    Object? solutions = null,
  }) {
    return _then(_$_RemoteQuiz(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      timeLimit: null == timeLimit
          ? _value.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as double,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      solutions: null == solutions
          ? _value._solutions
          : solutions // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RemoteQuiz implements _RemoteQuiz {
  const _$_RemoteQuiz(
      {required this.quizId,
      required this.type,
      required this.timeLimit,
      required this.question,
      required final List<String> answers,
      required final List<bool> solutions})
      : _answers = answers,
        _solutions = solutions;

  factory _$_RemoteQuiz.fromJson(Map<String, dynamic> json) =>
      _$$_RemoteQuizFromJson(json);

  @override
  final int quizId;
  @override
  final String type;
  @override
  final double timeLimit;
  @override
  final String question;
  final List<String> _answers;
  @override
  List<String> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  final List<bool> _solutions;
  @override
  List<bool> get solutions {
    if (_solutions is EqualUnmodifiableListView) return _solutions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_solutions);
  }

  @override
  String toString() {
    return 'RemoteQuiz(quizId: $quizId, type: $type, timeLimit: $timeLimit, question: $question, answers: $answers, solutions: $solutions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoteQuiz &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timeLimit, timeLimit) ||
                other.timeLimit == timeLimit) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality()
                .equals(other._solutions, _solutions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      quizId,
      type,
      timeLimit,
      question,
      const DeepCollectionEquality().hash(_answers),
      const DeepCollectionEquality().hash(_solutions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoteQuizCopyWith<_$_RemoteQuiz> get copyWith =>
      __$$_RemoteQuizCopyWithImpl<_$_RemoteQuiz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemoteQuizToJson(
      this,
    );
  }
}

abstract class _RemoteQuiz implements RemoteQuiz {
  const factory _RemoteQuiz(
      {required final int quizId,
      required final String type,
      required final double timeLimit,
      required final String question,
      required final List<String> answers,
      required final List<bool> solutions}) = _$_RemoteQuiz;

  factory _RemoteQuiz.fromJson(Map<String, dynamic> json) =
      _$_RemoteQuiz.fromJson;

  @override
  int get quizId;
  @override
  String get type;
  @override
  double get timeLimit;
  @override
  String get question;
  @override
  List<String> get answers;
  @override
  List<bool> get solutions;
  @override
  @JsonKey(ignore: true)
  _$$_RemoteQuizCopyWith<_$_RemoteQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}
