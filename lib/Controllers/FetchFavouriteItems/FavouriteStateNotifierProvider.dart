import 'package:booking_car_app_flutter/Controllers/FetchFavouriteItems/FavouriteState.dart';
import 'package:booking_car_app_flutter/Controllers/FetchFavouriteItems/FavouriteStateNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favouriteStateNotifierProvider =
    StateNotifierProvider.autoDispose<FavouriteStateNotifier, FavouriteState>(
        (ref) {
  return FavouriteStateNotifier();
});
