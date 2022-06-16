import 'package:book_net/services/http_header_option.dart';
import 'package:dio/dio.dart';

import '../../constants/endpoints.dart';
import '../../view_models/user/curr_user.dart';
import '../authentication/authentication_repository.dart';

class FeedRepository {
  static final _singleton = FeedRepository._internal();

  factory FeedRepository() {
    return _singleton;
  }

  FeedRepository._internal();

  Future<Response> createPostNews(
      String userId, String caption, List<String> imagesUrl) async {
    Dio _dio = Dio();
    Response response = await _dio.post(
      AppEndpoints.createPostNewsEndPoint,
      options: HttpHeaderOption().options,
      data: {"userId": userId, "caption": caption, "imagesUrl": imagesUrl},
    );
    return response;
  }

  Future<Response> getFeed(userId) async {
    Dio _dio = Dio();
    Response response = await _dio.get(
      "${AppEndpoints.feedEndPoint}/${CurrUserData().userId}",
    );
    return response;
  }
}
