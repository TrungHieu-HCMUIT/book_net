import 'package:book_net/services/authentication/authentication_provider.dart';
import 'package:book_net/view_models/verify_email_bloc.dart/verify_email_event.dart';
import 'package:book_net/view_models/verify_email_bloc.dart/verify_email_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  VerifyEmailBloc() : super(VerifyEmailState.initial()) {
    _mapEventToState();
  }

  void _mapEventToState() {
    on<OnVerifyEmailEvent>(_onVerifyEmailEvent);
  }

  void _onVerifyEmailEvent(
    OnVerifyEmailEvent event,
    Emitter<VerifyEmailState> emit,
  ) async {
    emit(VerifyEmailState.inProgress());
    await AuthenticationProvider().verifyEmail(event.email, event.token);
    emit(VerifyEmailState.pushSuccess());
  }
}
