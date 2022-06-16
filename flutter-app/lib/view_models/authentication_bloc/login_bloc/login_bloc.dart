import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_net/dto/user/user_dto.dart';
import 'package:book_net/services/authentication/authentication_provider.dart';
import 'package:book_net/view_models/authentication_bloc/login_bloc/login_event.dart';
import 'package:book_net/view_models/authentication_bloc/login_bloc/login_state.dart';

class LogInBloc extends Bloc<LoginEvent, LogInState> {
  LogInBloc() : super(const LogInState.initial()) {
    _mapEventToState();
  }

  void _mapEventToState() {
    on<LogInViaUsernameEvent>(_onLogInViaUserName);
  }

  void _onLogInViaUserName(
    LogInViaUsernameEvent event,
    Emitter<LogInState> emit,
  ) async {
    emit(const LogInState.inProgress());

    UserDto? response =
        await AuthenticationProvider().logIn(event.username, event.password);

    if (response == null) {
      emit(const LogInState.logInFail());
    } else {
      emit(const LogInState.logInSuccess());
    }
  }
}
