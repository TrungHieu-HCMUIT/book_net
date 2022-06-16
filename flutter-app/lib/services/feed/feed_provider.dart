import 'package:book_net/dto/news/news_response_dto.dart';
import 'package:dio/dio.dart';

import '../../constants/endpoints.dart';
import 'feed_repository.dart';

class FeedProvider {
  static final _singleton = FeedProvider._internal();

  factory FeedProvider() {
    return _singleton;
  }

  FeedProvider._internal();

  Future<void> createPostNews(
      String userId, String caption, List<String> imagesUrl) async {
    await FeedRepository().createPostNews(userId, caption, imagesUrl);
    return;
  }

  Future<List<NewsResponseDto>> getFeed(String userId) async {
    var response = await FeedRepository().getFeed(userId);
    List list = response.data['data'];

    List<NewsResponseDto> result =
        list.map((i) => NewsResponseDto.fromJson(i)).toList();
    return result;
  }
}
