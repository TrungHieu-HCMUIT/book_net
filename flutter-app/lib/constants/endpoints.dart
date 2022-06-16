import '../configs/app_configs.dart';

class AppEndpoints {
  // Use to append to base apiUrl
  static const _baseUrl = AppConfigs.apiUrl;

  static const _authEndPoint = "$_baseUrl/auth";
  static const signInEndPoint = _authEndPoint + "/signin";
  static const signUpEndPoint = _authEndPoint + "/signup";
  static const verifyEmailEndPoint = signUpEndPoint + "/submit_verification";

  static const feedEndPoint = "$_baseUrl/feed";
  static const createPostNewsEndPoint = feedEndPoint + "/post_news";
  static const reactEndPoint = feedEndPoint + "/react";
  static const createCommentEndPoint = feedEndPoint + "/comment";
  static const createReplyCommentEndPoint = feedEndPoint + "/reply_comment";

  static const guildEndPoint = "$_baseUrl/guilds";
}
