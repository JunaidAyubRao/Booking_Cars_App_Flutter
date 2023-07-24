import 'package:booking_car_app_flutter/Controllers/ChangeColorRiverpod/Colors_State.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorStateNotifier extends StateNotifier<ColorsStates> {
  ColorStateNotifier() : super(NonFavouriteState());

  get nonFavourite => state = NonFavouriteState();

  get favourite => state = FavouriteState();
//   void changeColor(int index, Color color) {
//     state[index] = color;
//   }
}
