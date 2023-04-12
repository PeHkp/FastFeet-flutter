import 'package:fast_feet/services/delivery/delivery_model.dart';

class MyDeliveryPageEvent {
  MyDeliveryPageEvent();
}

class LoadingMyDeliveryPageEvent extends MyDeliveryPageEvent {
  LoadingMyDeliveryPageEvent();
}

class UpdateDeliveryMyDeliveryPageEvent extends MyDeliveryPageEvent {
  DeliveryType delivery;
  UpdateDeliveryMyDeliveryPageEvent({required this.delivery});
}
