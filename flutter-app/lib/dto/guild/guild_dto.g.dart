// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GuildDto _$$_GuildDtoFromJson(Map<String, dynamic> json) => _$_GuildDto(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      memberList: (json['memberList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_GuildDtoToJson(_$_GuildDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'description': instance.description,
      'memberList': instance.memberList,
    };
