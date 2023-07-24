import 'package:booking_car_app_flutter/Controllers/FetchHomeVihicleItemsRiverpod/Cars_State.dart';
import 'package:booking_car_app_flutter/Models/Cars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarsStateNotifier extends StateNotifier<CarsState> {
  CarsStateNotifier() : super(CarsLoadingState());   
  fetchData() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();
      final documents = querySnapshot.docs;
      List<Cars> list = [];

      for (var x in documents) {
        list.add(Cars.fromMap(x.data()));
      }

      state = CarsLoadidState(albums: list);
    } catch (e) {
      state = CarsErrorState(errorMessage: e.toString());
    }
  }
}
