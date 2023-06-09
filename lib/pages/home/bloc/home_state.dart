class HomePageState {
  List? entregas = [];
  HomePageState({
    this.entregas,
  });

  HomePageState copyWith({
    List? entregas,
  }) {
    return HomePageState(
      entregas: entregas ?? this.entregas,
    );
  }
}

class ErrorState extends HomePageState {
  final String? message;

  ErrorState({
    this.message,
    List? entregas,
  }) : super(
          entregas: entregas,
        );
}

class LoadingHomePageState extends HomePageState {
  LoadingHomePageState({
    List? entregas,
  }) : super(
          entregas: entregas,
        );
}
