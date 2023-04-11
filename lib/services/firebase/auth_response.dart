class AuthResponse {
  final String messagem;
  final bool isSuccess;

  AuthResponse(this.isSuccess, this.messagem);

  AuthResponse.fromMap(
      {required bool responseSuccess, required String responseMessage})
      : this.isSuccess = responseSuccess,
        this.messagem = responseMessage;
}
