class LoginState {
  String? email;
  String? password;
  bool rememberMe;
  LoginState({this.email, this.password, this.rememberMe = false});

  LoginState copyWith({String? email, String? password, bool? rememberMe}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        rememberMe: rememberMe ?? this.rememberMe);
  }
}

class ErrorState extends LoginState {
  final String? message;

  ErrorState({this.message, String? email, String? password})
      : super(email: email, password: password);
}

class SendEmailSuccessState extends LoginState {
  final String? message;

  SendEmailSuccessState({
    this.message,
    String? email,
  }) : super(email: email);
}

class SuccessState extends LoginState {
  SuccessState({String? email, String? password})
      : super(email: email, password: password);
}

class LoadingLoginState extends LoginState {
  LoadingLoginState({
    String? email,
    String? password,
  }) : super(
          email: email,
          password: password,
        );
}
