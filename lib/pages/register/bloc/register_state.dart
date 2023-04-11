class RegisterState {
  String? email;
  String? password;
  String? name;
  RegisterState({this.email, this.password, this.name});

  RegisterState copyWith({String? email, String? password, String? name}) {
    return RegisterState(
        email: email ?? this.email,
        password: password ?? this.password,
        name: name ?? this.name);
  }
}

class ErrorState extends RegisterState {
  final String? message;

  ErrorState({this.message, String? email, String? password, String? name})
      : super(email: email, password: password, name: name);
}

class SuccessState extends RegisterState {
  SuccessState({String? email, String? password, String? name})
      : super(email: email, password: password, name: name);
}

class LoadingRegisterState extends RegisterState {
  LoadingRegisterState({String? email, String? password, String? name})
      : super(email: email, password: password, name: name);
}
