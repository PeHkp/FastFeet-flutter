class DeliveryType {
  final String id;
  final String data;
  final String adreess;
  final String entregador;
  final int state;
  final String nome;

  DeliveryType(
      {required this.id,
      required this.data,
      required this.adreess,
      required this.entregador,
      required this.state,
      required this.nome});

  DeliveryType.fromMap({
    required String id,
    required String data,
    required String adreess,
    required String entregador,
    required int state,
    required String nome,
  })  : this.id = id,
        this.data = data,
        this.adreess = adreess,
        this.entregador = entregador,
        this.state = state,
        this.nome = nome;
}

class DeliveryResponse {
  final String messagem;
  final bool isSuccess;
  final List<DeliveryType> deliverys;

  DeliveryResponse(this.isSuccess, this.messagem, this.deliverys);

  DeliveryResponse.fromMap(
      {required bool responseSuccess,
      required String responseMessage,
      required List<DeliveryType> responseDeliverys})
      : this.isSuccess = responseSuccess,
        this.messagem = responseMessage,
        this.deliverys = responseDeliverys;
}
