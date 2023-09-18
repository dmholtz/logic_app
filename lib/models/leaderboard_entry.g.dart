// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LeaderboardEntry _$$_LeaderboardEntryFromJson(Map<String, dynamic> json) =>
    _$_LeaderboardEntry(
      username: json['username'] as String,
      experience: (json['experience'] as num).toDouble(),
      points: json['points'] as int,
    );

Map<String, dynamic> _$$_LeaderboardEntryToJson(_$_LeaderboardEntry instance) =>
    <String, dynamic>{
      'username': instance.username,
      'experience': instance.experience,
      'points': instance.points,
    };
