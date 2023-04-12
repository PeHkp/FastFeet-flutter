import 'package:fast_feet/services/delivery/delivery_model.dart';

class HomePageEvent {
  HomePageEvent();
}

class LoadingHomePageEvent extends HomePageEvent {
  LoadingHomePageEvent();
}

class GetMyDeliveryEvent extends HomePageEvent {
  DeliveryType delivery;
  GetMyDeliveryEvent({required this.delivery});
}
