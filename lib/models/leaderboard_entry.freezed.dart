// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LeaderboardEntry _$LeaderboardEntryFromJson(Map<String, dynamic> json) {
  return _LeaderboardEntry.fromJson(json);
}

/// @nodoc
mixin _$LeaderboardEntry {
  String get username => throw _privateConstructorUsedError;
  double get experience => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaderboardEntryCopyWith<LeaderboardEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardEntryCopyWith<$Res> {
  factory $LeaderboardEntryCopyWith(
          LeaderboardEntry value, $Res Function(LeaderboardEntry) then) =
      _$LeaderboardEntryCopyWithImpl<$Res, LeaderboardEntry>;
  @useResult
  $Res call({String username, double experience, int points});
}

/// @nodoc
class _$LeaderboardEntryCopyWithImpl<$Res, $Val extends LeaderboardEntry>
    implements $LeaderboardEntryCopyWith<$Res> {
  _$LeaderboardEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? experience = null,
    Object? points = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as double,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LeaderboardEntryCopyWith<$Res>
    implements $LeaderboardEntryCopyWith<$Res> {
  factory _$$_LeaderboardEntryCopyWith(
          _$_LeaderboardEntry value, $Res Function(_$_LeaderboardEntry) then) =
      __$$_LeaderboardEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, double experience, int points});
}

/// @nodoc
class __$$_LeaderboardEntryCopyWithImpl<$Res>
    extends _$LeaderboardEntryCopyWithImpl<$Res, _$_LeaderboardEntry>
    implements _$$_LeaderboardEntryCopyWith<$Res> {
  __$$_LeaderboardEntryCopyWithImpl(
      _$_LeaderboardEntry _value, $Res Function(_$_LeaderboardEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? experience = null,
    Object? points = null,
  }) {
    return _then(_$_LeaderboardEntry(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as double,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LeaderboardEntry implements _LeaderboardEntry {
  const _$_LeaderboardEntry(
      {required this.username, required this.experience, required this.points});

  factory _$_LeaderboardEntry.fromJson(Map<String, dynamic> json) =>
      _$$_LeaderboardEntryFromJson(json);

  @override
  final String username;
  @override
  final double experience;
  @override
  final int points;

  @override
  String toString() {
    return 'LeaderboardEntry(username: $username, experience: $experience, points: $points)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LeaderboardEntry &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, experience, points);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LeaderboardEntryCopyWith<_$_LeaderboardEntry> get copyWith =>
      __$$_LeaderboardEntryCopyWithImpl<_$_LeaderboardEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LeaderboardEntryToJson(
      this,
    );
  }
}

abstract class _LeaderboardEntry implements LeaderboardEntry {
  const factory _LeaderboardEntry(
      {required final String username,
      required final double experience,
      required final int points}) = _$_LeaderboardEntry;

  factory _LeaderboardEntry.fromJson(Map<String, dynamic> json) =
      _$_LeaderboardEntry.fromJson;

  @override
  String get username;
  @override
  double get experience;
  @override
  int get points;
  @override
  @JsonKey(ignore: true)
  _$$_LeaderboardEntryCopyWith<_$_LeaderboardEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
