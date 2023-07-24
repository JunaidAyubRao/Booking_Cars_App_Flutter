import 'package:booking_car_app_flutter/Controllers/ChangeColorRiverpod/ColorStateNotifier.dart';
import 'package:booking_car_app_flutter/Controllers/ChangeColorRiverpod/Colors_State.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorStateProvider =
    StateNotifierProvider.family<ColorStateNotifier, ColorsStates, int>(
  (ref, arg) {
    return ColorStateNotifier();
  },
);
