import 'package:booking_car_app_flutter/Controllers/FetchFavouriteItems/FavouriteState.dart';
import 'package:booking_car_app_flutter/Models/Cars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteStateNotifier extends StateNotifier<FavouriteState> {
  FavouriteStateNotifier() : super(FavouriteLoadingState());

  fetchFavouriteData() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('FavouriteItems').get();
      final documents = querySnapshot.docs;
      List<Cars> list = [];

      for (var x in documents) {
        list.add(Cars.fromMap(x.data()));
      }

      state = FavouriteLoadidState(favouriteAlbums: list);
    } catch (e) {
      state = FavouriteErrorState(errorMessage: e.toString());
    }
  }
}
