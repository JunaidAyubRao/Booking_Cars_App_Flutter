import 'package:booking_car_app_flutter/Controllers/Fetch_Orders/OrderStateNotifier.dart';
import 'package:booking_car_app_flutter/Controllers/Fetch_Orders/OrdersState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ordersStateProvider =
    StateNotifierProvider.autoDispose<OrdersStateNotifier, OrdersState>((ref) {
  return OrdersStateNotifier();
});
