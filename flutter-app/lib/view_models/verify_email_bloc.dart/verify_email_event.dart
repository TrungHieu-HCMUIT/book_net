import 'package:equatable/equatable.dart';

abstract class VerifyEmailEvent extends Equatable {
  const VerifyEmailEvent();

  @override
  List<Object> get props => [];
}

class OnVerifyEmailEvent extends VerifyEmailEvent {
  String email, token;

  OnVerifyEmailEvent({required this.email, required this.token});

  @override
  List<Object> get props => [];
}
