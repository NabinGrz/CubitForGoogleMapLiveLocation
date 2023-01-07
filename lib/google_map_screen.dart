import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemapwithcubit/google_map_cubit/location_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googlemapwithcubit/google_map_cubit/location_state.dart';

// In a widget that needs to display the current location data, use a BlocBuilder
class MyLocationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationMainState>(
      builder: (context, state) {
        if (state is LocationState) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(state.latitude, state.longitude),
              zoom: 16.0,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('currentLocation'),
                position: LatLng(state.latitude, state.longitude),
              ),
            },
          );
        } else if (state is ErrorState) {
          return const Text('Something Went Wrong!!');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
