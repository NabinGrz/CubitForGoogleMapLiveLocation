import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googlemapwithcubit/google_map_cubit/location_cubit.dart';
import 'package:googlemapwithcubit/google_map_screen.dart';

void main() {
  // use a BlocProvider to provide the LocationCubit
  runApp(BlocProvider(
    create: (context) => LocationCubit(),
    child: MaterialApp(home: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locationCubit = context.watch<LocationCubit>();
    locationCubit.getCurrentLocation();
    return Scaffold(body: MyLocationWidget());
  }
}
