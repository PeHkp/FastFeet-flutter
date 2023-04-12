import 'package:fast_feet/pages/my_delivery/bloc/my_delivery_event.dart';
import 'package:fast_feet/pages/my_delivery/bloc/my_delivery_state.dart';
import 'package:fast_feet/services/auth/auth_service.dart';
import 'package:fast_feet/services/delivery/delivery_model.dart';
import 'package:fast_feet/services/delivery/delivery_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDeliveryPageBloc
    extends Bloc<MyDeliveryPageEvent, MyDeliveryPageState> {
  final authService = AuthService();
  final deliveryService = DeliveryService();

  MyDeliveryPageBloc() : super(LoadingMyDeliveryPageState()) {
    on<LoadingMyDeliveryPageEvent>(
        (event, emit) => loadingMyDeliveryPage(event, emit));
    on<UpdateDeliveryMyDeliveryPageEvent>(
        (event, emit) => updateDeliveryMyDeliveryPageEvent(event, emit));
  }

  void loadingMyDeliveryPage(LoadingMyDeliveryPageEvent event,
      Emitter<MyDeliveryPageState> emit) async {
    DeliveryResponse response =
        await deliveryService.getMyDelivery(authService.currentUser!.uid);
    if (response.isSuccess) {
      emit(MyDeliveryPageState(entregas: response.deliverys));
    } else {
      emit(ErrorState(
        entregas: [],
        message: response.messagem,
      ));
    }
  }

  void updateDeliveryMyDeliveryPageEvent(
      UpdateDeliveryMyDeliveryPageEvent event,
      Emitter<MyDeliveryPageState> emit) async {
    DeliveryResponse response =
        await deliveryService.updatetMyDelivery(event.delivery);
    if (response.isSuccess) {
      emit(MyDeliveryPageState(entregas: state.entregas));
    } else {
      emit(ErrorState(
        entregas: state.entregas,
        message: response.messagem,
      ));
    }
  }
}
