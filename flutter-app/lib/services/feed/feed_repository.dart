import 'package:dio/dio.dart';

import '../../constants/endpoints.dart';
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
      options: Options(
        headers: {
          "Authorization": "Bearer ${AuthenticationRepository().accessToken}"
        },
      ),
      data: {"userId": userId, "caption": caption, "imagesUrl": imagesUrl},
    );
    return response;
  }
}
