import 'package:fast_feet/pages/home/bloc/home_event.dart';
import 'package:fast_feet/pages/home/bloc/home_state.dart';
import 'package:fast_feet/services/auth/auth_service.dart';
import 'package:fast_feet/services/delivery/delivery_model.dart';
import 'package:fast_feet/services/delivery/delivery_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final authService = AuthService();
  final deliveryService = DeliveryService();

  HomePageBloc() : super(LoadingHomePageState()) {
    on<LoadingHomePageEvent>((event, emit) => loadingHomePage(event, emit));
    on<GetMyDeliveryEvent>((event, emit) => getMyDelivery(event, emit));
  }

  void loadingHomePage(
      LoadingHomePageEvent event, Emitter<HomePageState> emit) async {
    DeliveryResponse response = await deliveryService.getDelivery();
    if (response.isSuccess) {
      emit(HomePageState(entregas: response.deliverys));
    } else {
      emit(ErrorState(
        entregas: [],
        message: response.messagem,
      ));
    }
  }

  void getMyDelivery(
      GetMyDeliveryEvent event, Emitter<HomePageState> emit) async {
    DeliveryResponse response = await deliveryService.makeMyDelivery(
        event.delivery, authService.currentUser!.uid);
    if (response.isSuccess) {
      emit(HomePageState(entregas: state.entregas));
    } else {
      emit(ErrorState(
        entregas: state.entregas,
        message: response.messagem,
      ));
    }
  }
}
