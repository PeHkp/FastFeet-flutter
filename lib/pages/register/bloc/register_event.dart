class RegisterEvent {
  RegisterEvent();
}

class SignUpEvent extends RegisterEvent {
  String email;
  String password;
  String name;

  SignUpEvent(
      {required this.email, required this.password, required this.name});
}
