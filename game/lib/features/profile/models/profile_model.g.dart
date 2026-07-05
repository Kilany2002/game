// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      wins: (json['wins'] as num).toInt(),
      gamesPlayed: (json['gamesPlayed'] as num).toInt(),
      totalPoints: (json['totalPoints'] as num).toInt(),
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'wins': instance.wins,
      'gamesPlayed': instance.gamesPlayed,
      'totalPoints': instance.totalPoints,
      'avatarUrl': instance.avatarUrl,
    };
