import 'package:book_net/services/http_header_option.dart';
import 'package:dio/dio.dart';

import '../../constants/endpoints.dart';

class GuildRepository {
  static final _singleton = GuildRepository._internal();

  factory GuildRepository() {
    return _singleton;
  }

  GuildRepository._internal();

  Future<Response> getGuildList() async {
    Dio _dio = Dio();
    Response response = await _dio.get(
      AppEndpoints.guildEndPoint,
    );
    return response;
  }
}
