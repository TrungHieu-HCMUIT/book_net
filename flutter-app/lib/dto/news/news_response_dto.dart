import 'package:book_net/dto/news/comment_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_response_dto.freezed.dart';
part 'news_response_dto.g.dart';

@freezed
class NewsResponseDto with _$NewsResponseDto {
  factory NewsResponseDto({
    required String id,
    required String userId,
    required int type,
    required String caption,
    required List<String> likeUserIdList,
    required List<CommentDto> commentList,
    required int createDate,
    required List<String> imagesUrl,
    required String reviewId,
    //TODO: Fix here
  }) = _NewsResponseDto;

  factory NewsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseDtoFromJson(json);
}
