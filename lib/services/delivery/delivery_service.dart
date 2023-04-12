import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_feet/services/auth/auth_response.dart';
import 'package:fast_feet/services/delivery/delivery_model.dart';

class DeliveryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  errorHandler(error) {
    switch (error.code) {
      default:
        return "Erro inesperado, tente novamente!";
    }
  }

  Future<DeliveryResponse> getDelivery() async {
    try {
      List<DeliveryType> list = [];

      QuerySnapshot query = await _firestore.collection("deliverys").get();

      for (var doc in query.docs) {
        String entregador = doc.get("entregador");
        if (entregador == "") {
          list.add(DeliveryType(
              adreess: doc.get("adress"),
              data: doc.get("date"),
              entregador: doc.get("entregador"),
              nome: doc.get("name"),
              state: doc.get("state"),
              id: doc.id));
        }
      }

      return DeliveryResponse.fromMap(
          responseSuccess: true, responseMessage: "", responseDeliverys: list);
    } catch (e) {
      return DeliveryResponse.fromMap(
          responseSuccess: false,
          responseMessage: errorHandler(e),
          responseDeliverys: []);
    }
  }

  Future<DeliveryResponse> getMyDelivery(String uid) async {
    try {
      List<DeliveryType> list = [];

      QuerySnapshot query = await _firestore.collection("deliverys").get();

      for (var doc in query.docs) {
        String entregador = doc.get("entregador");
        if (entregador == uid) {
          list.add(DeliveryType(
              adreess: doc.get("adress"),
              data: doc.get("date"),
              entregador: doc.get("entregador"),
              nome: doc.get("name"),
              state: doc.get("state"),
              id: doc.id));
        }
      }

      return DeliveryResponse.fromMap(
          responseSuccess: true, responseMessage: "", responseDeliverys: list);
    } catch (e) {
      return DeliveryResponse.fromMap(
          responseSuccess: false,
          responseMessage: errorHandler(e),
          responseDeliverys: []);
    }
  }

  Future<DeliveryResponse> updatetMyDelivery(DeliveryType delivery) async {
    try {
      await _firestore
          .collection("deliverys")
          .doc(delivery.id)
          .update({"state": delivery.state + 1});

      return DeliveryResponse.fromMap(
          responseSuccess: true, responseMessage: "", responseDeliverys: []);
    } catch (e) {
      return DeliveryResponse.fromMap(
          responseSuccess: false,
          responseMessage: errorHandler(e),
          responseDeliverys: []);
    }
  }

  Future<DeliveryResponse> makeMyDelivery(
      DeliveryType delivery, String uid) async {
    try {
      await _firestore
          .collection("deliverys")
          .doc(delivery.id)
          .update({"entregador": uid});

      return DeliveryResponse.fromMap(
          responseSuccess: true, responseMessage: "", responseDeliverys: []);
    } catch (e) {
      return DeliveryResponse.fromMap(
          responseSuccess: false,
          responseMessage: errorHandler(e),
          responseDeliverys: []);
    }
  }
}
