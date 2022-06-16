import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class OnSignUpEvent extends SignUpEvent {
  final String email, username, name, password;

  const OnSignUpEvent(
      {required this.email,
      required this.username,
      required this.name,
      required this.password});

  @override
  List<Object> get props => [email, username, password];
}

class VerifyEmailEvent extends SignUpEvent {
  final String email, token;

  const VerifyEmailEvent({required this.email, required this.token});

  @override
  List<Object> get props => [email, token];
}
