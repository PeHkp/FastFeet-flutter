class ForgotPasswordEvent {
  ForgotPasswordEvent();
}

class SendForgotPasswordEvent extends ForgotPasswordEvent {
  String email;
  SendForgotPasswordEvent({required this.email});
}
