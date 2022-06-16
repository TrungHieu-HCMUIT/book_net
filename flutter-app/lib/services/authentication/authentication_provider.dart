import 'package:book_net/dto/user/user_dto.dart';
import 'package:book_net/services/authentication/authentication_repository.dart';
import 'package:book_net/view_models/user/curr_user.dart';

class AuthenticationProvider {
  static final AuthenticationProvider _singleton =
      AuthenticationProvider._internal();

  factory AuthenticationProvider() {
    return _singleton;
  }

  AuthenticationProvider._internal();

  Future<UserDto?> logIn(String username, String password) async {
    final response = await AuthenticationRepository().logIn(username, password);

    final result = response.data["data"];
    AuthenticationRepository().accessToken = result["token"];

    CurrUserData().user = UserDto.fromJson(result);

    return CurrUserData().user;
  }

  Future<void> signUp(String email, String username, String name, String password) async {
    await AuthenticationRepository().signUp(email, username, name, password);
  }

  Future<void> verifyEmail(String email, String token) async {
    await AuthenticationRepository().verifyEmail(email, token);
  }
}
