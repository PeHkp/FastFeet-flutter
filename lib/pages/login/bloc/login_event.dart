class LoginEvent {
  LoginEvent();
}

class SignInEvent extends LoginEvent {
  String email;
  String password;

  SignInEvent({required this.email, required this.password});
}

class ChangeRememberEvent extends LoginEvent {}
