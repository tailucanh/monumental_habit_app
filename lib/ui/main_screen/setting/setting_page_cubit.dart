import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:monumental_habit_app/ui/main_screen/profile/profile_page_state.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/setting_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/setting_page_state.dart';

class SettingPageCubit extends Cubit<SettingPageState> {
  final SettingPageNavigator navigator;

  SettingPageCubit({
    required this.navigator,
  }) : super(const SettingPageState());

}