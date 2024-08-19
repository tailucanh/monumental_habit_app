import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:monumental_habit_app/ui/main_screen/home/home_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/home/home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final HomePageNavigator navigator;

  HomePageCubit({
    required this.navigator,
  }) : super(const HomePageState());

  void openProfilePage() {
    navigator.openProfilePage();
  }

}