import 'package:fast_feet/pages/register/bloc/register_event.dart';
import 'package:fast_feet/pages/register/bloc/register_state.dart';
import 'package:fast_feet/services/auth/auth_response.dart';
import 'package:fast_feet/services/auth/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final authService = AuthService();
  RegisterBloc() : super(RegisterState()) {
    on<SignUpEvent>((event, emit) => signUp(event, emit));
  }

  void signUp(SignUpEvent event, Emitter<RegisterState> emit) async {
    emit(LoadingRegisterState(email: event.email, password: event.password));

    AuthResponse response = await authService.createUserWithEmailAndPassword(
        email: event.email, password: event.password);
    await authService.updateInfos(name: event.name);

    if (response.isSuccess) {
      emit(SuccessState(email: event.email, password: event.password));
    } else {
      emit(ErrorState(
          email: event.email,
          message: response.messagem,
          password: event.password));
    }
  }
}
