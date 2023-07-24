import 'package:booking_car_app_flutter/Models/Cars.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FavouriteState {}

@immutable
class FavouriteInitialState extends FavouriteState {}

@immutable
class FavouriteLoadingState extends FavouriteState {}

@immutable
class FavouriteLoadidState extends FavouriteState {
  FavouriteLoadidState({required this.favouriteAlbums});
  final List<Cars> favouriteAlbums;
}

@immutable
class FavouriteErrorState extends FavouriteState {
  final String errorMessage;
  FavouriteErrorState({required this.errorMessage});
}
