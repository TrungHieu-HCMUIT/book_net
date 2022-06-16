// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsResponseDto _$$_NewsResponseDtoFromJson(Map<String, dynamic> json) =>
    _$_NewsResponseDto(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: json['type'] as int,
      caption: json['caption'] as String,
      likeUserIdList: (json['likeUserIdList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      commentList: (json['commentList'] as List<dynamic>)
          .map((e) => CommentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      createDate: json['createDate'] as int,
      imagesUrl:
          (json['imagesUrl'] as List<dynamic>).map((e) => e as String).toList(),
      reviewId: json['reviewId'] as String,
    );

Map<String, dynamic> _$$_NewsResponseDtoToJson(_$_NewsResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'caption': instance.caption,
      'likeUserIdList': instance.likeUserIdList,
      'commentList': instance.commentList,
      'createDate': instance.createDate,
      'imagesUrl': instance.imagesUrl,
      'reviewId': instance.reviewId,
    };
