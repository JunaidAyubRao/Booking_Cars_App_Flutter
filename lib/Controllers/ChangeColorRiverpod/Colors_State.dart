import 'package:flutter/material.dart';

@immutable
abstract class ColorsStates {}

@immutable
class FavouriteState extends ColorsStates {}

@immutable
class NonFavouriteState extends ColorsStates {}
