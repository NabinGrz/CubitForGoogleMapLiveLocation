import 'package:flutter/material.dart';

// Create a state class to hold the current location data
@immutable
abstract class LocationMainState {}

class LocationState extends LocationMainState {
  final double latitude;
  final double longitude;
  LocationState({required this.latitude, required this.longitude});
}

// For any error occured
class ErrorState extends LocationMainState {
  ErrorState();
}
