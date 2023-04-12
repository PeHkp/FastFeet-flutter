class MyDeliveryPageState {
  List? entregas = [];
  MyDeliveryPageState({
    this.entregas,
  });

  MyDeliveryPageState copyWith({
    List? entregas,
  }) {
    return MyDeliveryPageState(
      entregas: entregas ?? this.entregas,
    );
  }
}

class ErrorState extends MyDeliveryPageState {
  final String? message;

  ErrorState({
    this.message,
    List? entregas,
  }) : super(
          entregas: entregas,
        );
}

class LoadingMyDeliveryPageState extends MyDeliveryPageState {
  LoadingMyDeliveryPageState({
    List? entregas,
  }) : super(
          entregas: entregas,
        );
}
