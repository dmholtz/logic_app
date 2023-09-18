// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Achievement _$AchievementFromJson(Map<String, dynamic> json) {
  return _Achievement.fromJson(json);
}

/// @nodoc
mixin _$Achievement {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get level => throw _privateConstructorUsedError;
  bool get achieved => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AchievementCopyWith<Achievement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementCopyWith<$Res> {
  factory $AchievementCopyWith(
          Achievement value, $Res Function(Achievement) then) =
      _$AchievementCopyWithImpl<$Res, Achievement>;
  @useResult
  $Res call({String name, String description, String level, bool achieved});
}

/// @nodoc
class _$AchievementCopyWithImpl<$Res, $Val extends Achievement>
    implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? level = null,
    Object? achieved = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      achieved: null == achieved
          ? _value.achieved
          : achieved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AchievementCopyWith<$Res>
    implements $AchievementCopyWith<$Res> {
  factory _$$_AchievementCopyWith(
          _$_Achievement value, $Res Function(_$_Achievement) then) =
      __$$_AchievementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String description, String level, bool achieved});
}

/// @nodoc
class __$$_AchievementCopyWithImpl<$Res>
    extends _$AchievementCopyWithImpl<$Res, _$_Achievement>
    implements _$$_AchievementCopyWith<$Res> {
  __$$_AchievementCopyWithImpl(
      _$_Achievement _value, $Res Function(_$_Achievement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? level = null,
    Object? achieved = null,
  }) {
    return _then(_$_Achievement(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      achieved: null == achieved
          ? _value.achieved
          : achieved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Achievement implements _Achievement {
  const _$_Achievement(
      {required this.name,
      required this.description,
      required this.level,
      required this.achieved});

  factory _$_Achievement.fromJson(Map<String, dynamic> json) =>
      _$$_AchievementFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final String level;
  @override
  final bool achieved;

  @override
  String toString() {
    return 'Achievement(name: $name, description: $description, level: $level, achieved: $achieved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Achievement &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.achieved, achieved) ||
                other.achieved == achieved));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, level, achieved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AchievementCopyWith<_$_Achievement> get copyWith =>
      __$$_AchievementCopyWithImpl<_$_Achievement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AchievementToJson(
      this,
    );
  }
}

abstract class _Achievement implements Achievement {
  const factory _Achievement(
      {required final String name,
      required final String description,
      required final String level,
      required final bool achieved}) = _$_Achievement;

  factory _Achievement.fromJson(Map<String, dynamic> json) =
      _$_Achievement.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  String get level;
  @override
  bool get achieved;
  @override
  @JsonKey(ignore: true)
  _$$_AchievementCopyWith<_$_Achievement> get copyWith =>
      throw _privateConstructorUsedError;
}
