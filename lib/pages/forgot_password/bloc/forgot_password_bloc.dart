import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_feet/pages/forgot_password/bloc/forgot_password_event.dart';
import 'package:fast_feet/pages/forgot_password/bloc/forgot_password_state.dart';
import 'package:fast_feet/services/firebase/auth_response.dart';
import 'package:fast_feet/services/firebase/auth_service.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final authService = AuthService();
  ForgotPasswordBloc() : super(ForgotPasswordState()) {
    on<SendForgotPasswordEvent>((event, emit) => forgotPassword(event, emit));
  }

  void forgotPassword(
      SendForgotPasswordEvent event, Emitter<ForgotPasswordState> emit) async {
    AuthResponse response =
        await authService.sendPasswordResetEmail(email: event.email);
    if (response.isSuccess) {
      emit(SendEmailSuccessState(
          email: event.email, message: response.messagem));
    } else {
      emit(ErrorState(
        email: event.email,
        message: response.messagem,
      ));
    }
  }
}
