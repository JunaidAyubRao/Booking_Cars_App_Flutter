import 'package:booking_car_app_flutter/Controllers/FetchFavouriteItems/FetchFavouriteItems.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({
    super.key,
  });

  static const pageName = '/FavouritePage';

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // var width = size.width;
    // var height = size.height;
    return Scaffold(body: MyFavouriteWidget());
  }
}
