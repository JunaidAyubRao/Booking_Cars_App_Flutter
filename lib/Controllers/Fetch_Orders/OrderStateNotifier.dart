import 'package:booking_car_app_flutter/Controllers/Fetch_Orders/OrdersState.dart';
import 'package:booking_car_app_flutter/Models/OrdersPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersStateNotifier extends StateNotifier<OrdersState> {
  OrdersStateNotifier() : super(OrdersLoadingState());

  fetchData() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('Orders').get();
      final documents = querySnapshot.docs;
      List<Orders> list = [];

      for (var x in documents) {
        list.add(Orders.fromMap(x.data()));
      }

      state = OrdersLoadidState(orders: list);
    } catch (e) {
      state = OrdersErrorState(errorMessage: e.toString());
    }
  }
}
