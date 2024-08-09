import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'home_screen_navigator.dart';
import 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final HomeScreenNavigator navigator;

  HomeScreenCubit({
    required this.navigator,
  }) : super(HomeScreenState());

  Future<void> getLocation() async {
    try {

    } on Exception {
      return Future.error('Location services are disabled.');
    }
  }



  Future<bool> getLocationUser() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return true;
  }

}