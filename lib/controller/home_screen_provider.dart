import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  DateTime? collectionDate;
  DateTime? deliveryDate;
  String? collectionTime;
  String? deliveryTime;
  bool? isCollectionSlotMorning;
  bool? isDeliverySlotMorning;

  void notify() {
    notifyListeners();
  }
}
