// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Achievement _$$_AchievementFromJson(Map<String, dynamic> json) =>
    _$_Achievement(
      name: json['name'] as String,
      description: json['description'] as String,
      level: json['level'] as String,
      achieved: json['achieved'] as bool,
    );

Map<String, dynamic> _$$_AchievementToJson(_$_Achievement instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'level': instance.level,
      'achieved': instance.achieved,
    };
