class ForgotPasswordState {
  String? email;
  ForgotPasswordState({
    this.email,
  });

  ForgotPasswordState copyWith({
    String? email,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
    );
  }
}

class ErrorState extends ForgotPasswordState {
  final String? message;

  ErrorState({
    this.message,
    String? email,
  }) : super(
          email: email,
        );
}

class SendEmailSuccessState extends ForgotPasswordState {
  final String? message;

  SendEmailSuccessState({
    this.message,
    String? email,
  }) : super(email: email);
}

class LoadingForgotPasswordState extends ForgotPasswordState {
  LoadingForgotPasswordState({
    String? email,
  }) : super(
          email: email,
        );
}
