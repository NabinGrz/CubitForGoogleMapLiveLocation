import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googlemapwithcubit/google_map_cubit/location_state.dart';
import 'package:location/location.dart';

// Create a cubit to handle the location data
class LocationCubit extends Cubit<LocationMainState> {
  final Location _location = Location();

  LocationCubit() : super(LocationState(latitude: 0, longitude: 0));

  // Method to get the current location of the user
  void getCurrentLocation() async {
    try {
      // Request location permissions from the user
      await _location.requestPermission();
      // Get the current location
      final locationData = await _location.getLocation();
      // Emit a new state with the current location data
      emit(LocationState(
        latitude: locationData.latitude ?? 0,
        longitude: locationData.longitude ?? 0,
      ));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
