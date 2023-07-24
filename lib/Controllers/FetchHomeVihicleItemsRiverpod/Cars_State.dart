import 'package:booking_car_app_flutter/Models/Cars.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CarsState {}

@immutable
class CarsInitialState extends CarsState {}

@immutable
class CarsLoadingState extends CarsState {}

@immutable
class CarsLoadidState extends CarsState {
  CarsLoadidState({required this.albums});

  final List<Cars> albums;
}

@immutable
class CarsErrorState extends CarsState {
  final String? errorMessage;
  CarsErrorState({required this.errorMessage});
}
