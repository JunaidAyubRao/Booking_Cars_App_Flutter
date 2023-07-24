import 'package:booking_car_app_flutter/Controllers/FetchHomeVihicleItemsRiverpod/CarsStateNotifier.dart';
import 'package:booking_car_app_flutter/Controllers/FetchHomeVihicleItemsRiverpod/Cars_State.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final carsStateProvider =
    StateNotifierProvider.autoDispose<CarsStateNotifier, CarsState>((ref) {
  return CarsStateNotifier();
});
