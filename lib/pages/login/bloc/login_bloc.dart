import 'package:fast_feet/pages/login/bloc/login_event.dart';
import 'package:fast_feet/pages/login/bloc/login_state.dart';
import 'package:fast_feet/services/firebase/auth_response.dart';
import 'package:fast_feet/services/firebase/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final authService = AuthService();
  LoginBloc() : super(LoginState()) {
    on<SignInEvent>((event, emit) => signIn(event, emit));
    on<ChangeRememberEvent>((event, emit) => changeRemember(event, emit));
  }

  void changeRemember(ChangeRememberEvent event, Emitter<LoginState> emit) {}

  void signIn(SignInEvent event, Emitter<LoginState> emit) async {
    emit(LoadingLoginState(email: event.email, password: event.password));

    AuthResponse response = await authService.signInWithEmailAndPassword(
        email: event.email, password: event.password);

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
