import 'package:booking_car_app_flutter/Models/Cars.dart';
import 'package:booking_car_app_flutter/Models/OrdersPage.dart';
import 'package:flutter/material.dart';

@immutable
abstract class OrdersState {}

@immutable
class OrdersInitialState extends OrdersState {}

@immutable
class OrdersLoadingState extends OrdersState {}

@immutable
class OrdersLoadidState extends OrdersState {
  OrdersLoadidState({required this.orders});

  final List<Orders> orders;
}

@immutable
class OrdersErrorState extends OrdersState {
  final String? errorMessage;
  OrdersErrorState({required this.errorMessage});
}
