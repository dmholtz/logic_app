// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_solved_submission_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizSolvedSubmissionResponse _$QuizSolvedSubmissionResponseFromJson(
    Map<String, dynamic> json) {
  return _QuizSolvedSubmissionResponse.fromJson(json);
}

/// @nodoc
mixin _$QuizSolvedSubmissionResponse {
  int get points => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizSolvedSubmissionResponseCopyWith<QuizSolvedSubmissionResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizSolvedSubmissionResponseCopyWith<$Res> {
  factory $QuizSolvedSubmissionResponseCopyWith(
          QuizSolvedSubmissionResponse value,
          $Res Function(QuizSolvedSubmissionResponse) then) =
      _$QuizSolvedSubmissionResponseCopyWithImpl<$Res,
          QuizSolvedSubmissionResponse>;
  @useResult
  $Res call({int points});
}

/// @nodoc
class _$QuizSolvedSubmissionResponseCopyWithImpl<$Res,
        $Val extends QuizSolvedSubmissionResponse>
    implements $QuizSolvedSubmissionResponseCopyWith<$Res> {
  _$QuizSolvedSubmissionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
  }) {
    return _then(_value.copyWith(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizSolvedSubmissionResponseCopyWith<$Res>
    implements $QuizSolvedSubmissionResponseCopyWith<$Res> {
  factory _$$_QuizSolvedSubmissionResponseCopyWith(
          _$_QuizSolvedSubmissionResponse value,
          $Res Function(_$_QuizSolvedSubmissionResponse) then) =
      __$$_QuizSolvedSubmissionResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int points});
}

/// @nodoc
class __$$_QuizSolvedSubmissionResponseCopyWithImpl<$Res>
    extends _$QuizSolvedSubmissionResponseCopyWithImpl<$Res,
        _$_QuizSolvedSubmissionResponse>
    implements _$$_QuizSolvedSubmissionResponseCopyWith<$Res> {
  __$$_QuizSolvedSubmissionResponseCopyWithImpl(
      _$_QuizSolvedSubmissionResponse _value,
      $Res Function(_$_QuizSolvedSubmissionResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
  }) {
    return _then(_$_QuizSolvedSubmissionResponse(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizSolvedSubmissionResponse implements _QuizSolvedSubmissionResponse {
  const _$_QuizSolvedSubmissionResponse({required this.points});

  factory _$_QuizSolvedSubmissionResponse.fromJson(Map<String, dynamic> json) =>
      _$$_QuizSolvedSubmissionResponseFromJson(json);

  @override
  final int points;

  @override
  String toString() {
    return 'QuizSolvedSubmissionResponse(points: $points)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizSolvedSubmissionResponse &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, points);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizSolvedSubmissionResponseCopyWith<_$_QuizSolvedSubmissionResponse>
      get copyWith => __$$_QuizSolvedSubmissionResponseCopyWithImpl<
          _$_QuizSolvedSubmissionResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizSolvedSubmissionResponseToJson(
      this,
    );
  }
}

abstract class _QuizSolvedSubmissionResponse
    implements QuizSolvedSubmissionResponse {
  const factory _QuizSolvedSubmissionResponse({required final int points}) =
      _$_QuizSolvedSubmissionResponse;

  factory _QuizSolvedSubmissionResponse.fromJson(Map<String, dynamic> json) =
      _$_QuizSolvedSubmissionResponse.fromJson;

  @override
  int get points;
  @override
  @JsonKey(ignore: true)
  _$$_QuizSolvedSubmissionResponseCopyWith<_$_QuizSolvedSubmissionResponse>
      get copyWith => throw _privateConstructorUsedError;
}
