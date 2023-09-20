// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_solved_submission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizSolvedSubmission _$QuizSolvedSubmissionFromJson(Map<String, dynamic> json) {
  return _QuizSolvedSubmission.fromJson(json);
}

/// @nodoc
mixin _$QuizSolvedSubmission {
  int get quizId => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  double? get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizSolvedSubmissionCopyWith<QuizSolvedSubmission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizSolvedSubmissionCopyWith<$Res> {
  factory $QuizSolvedSubmissionCopyWith(QuizSolvedSubmission value,
          $Res Function(QuizSolvedSubmission) then) =
      _$QuizSolvedSubmissionCopyWithImpl<$Res, QuizSolvedSubmission>;
  @useResult
  $Res call({int quizId, bool isCorrect, double? time});
}

/// @nodoc
class _$QuizSolvedSubmissionCopyWithImpl<$Res,
        $Val extends QuizSolvedSubmission>
    implements $QuizSolvedSubmissionCopyWith<$Res> {
  _$QuizSolvedSubmissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? isCorrect = null,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizSolvedSubmissionCopyWith<$Res>
    implements $QuizSolvedSubmissionCopyWith<$Res> {
  factory _$$_QuizSolvedSubmissionCopyWith(_$_QuizSolvedSubmission value,
          $Res Function(_$_QuizSolvedSubmission) then) =
      __$$_QuizSolvedSubmissionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int quizId, bool isCorrect, double? time});
}

/// @nodoc
class __$$_QuizSolvedSubmissionCopyWithImpl<$Res>
    extends _$QuizSolvedSubmissionCopyWithImpl<$Res, _$_QuizSolvedSubmission>
    implements _$$_QuizSolvedSubmissionCopyWith<$Res> {
  __$$_QuizSolvedSubmissionCopyWithImpl(_$_QuizSolvedSubmission _value,
      $Res Function(_$_QuizSolvedSubmission) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? isCorrect = null,
    Object? time = freezed,
  }) {
    return _then(_$_QuizSolvedSubmission(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizSolvedSubmission implements _QuizSolvedSubmission {
  const _$_QuizSolvedSubmission(
      {required this.quizId, required this.isCorrect, this.time});

  factory _$_QuizSolvedSubmission.fromJson(Map<String, dynamic> json) =>
      _$$_QuizSolvedSubmissionFromJson(json);

  @override
  final int quizId;
  @override
  final bool isCorrect;
  @override
  final double? time;

  @override
  String toString() {
    return 'QuizSolvedSubmission(quizId: $quizId, isCorrect: $isCorrect, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizSolvedSubmission &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, quizId, isCorrect, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizSolvedSubmissionCopyWith<_$_QuizSolvedSubmission> get copyWith =>
      __$$_QuizSolvedSubmissionCopyWithImpl<_$_QuizSolvedSubmission>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizSolvedSubmissionToJson(
      this,
    );
  }
}

abstract class _QuizSolvedSubmission implements QuizSolvedSubmission {
  const factory _QuizSolvedSubmission(
      {required final int quizId,
      required final bool isCorrect,
      final double? time}) = _$_QuizSolvedSubmission;

  factory _QuizSolvedSubmission.fromJson(Map<String, dynamic> json) =
      _$_QuizSolvedSubmission.fromJson;

  @override
  int get quizId;
  @override
  bool get isCorrect;
  @override
  double? get time;
  @override
  @JsonKey(ignore: true)
  _$$_QuizSolvedSubmissionCopyWith<_$_QuizSolvedSubmission> get copyWith =>
      throw _privateConstructorUsedError;
}
