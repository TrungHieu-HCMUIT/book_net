import 'package:bloc/bloc.dart';
import 'package:book_net/services/authentication/authentication_provider.dart';
import 'package:book_net/view_models/authentication_bloc/signup_bloc/signup_event.dart';
import 'package:book_net/view_models/authentication_bloc/signup_bloc/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState.initial()) {
    _mapEventToState();
  }

  void _mapEventToState() {
    on<OnSignUpEvent>(_onSignUp);
    on<VerifyEmailEvent>(_verifyEmail);
  }

  void _onSignUp(
    OnSignUpEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(const SignUpState.inProgress());

    await AuthenticationProvider()
        .signUp(event.email, event.username, event.name, event.password);
    emit(const SignUpState.signUpSuccess());
  }

  void _verifyEmail(VerifyEmailEvent event, Emitter<SignUpState> emit) async {
    emit(const SignUpState.inProgress());

    await AuthenticationProvider().verifyEmail(event.email, event.token);
    emit(const SignUpState.signUpSuccess());
  }
}
