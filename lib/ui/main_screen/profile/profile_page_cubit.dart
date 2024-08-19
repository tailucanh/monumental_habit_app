import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:monumental_habit_app/models/progress_time_profile.dart';
import 'package:monumental_habit_app/services/app_colors.dart';
import 'package:monumental_habit_app/ui/main_screen/profile/profile_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/profile/profile_page_state.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  final ProfilePageNavigator navigator;

  ProfilePageCubit({
    required this.navigator,
  }) : super(const ProfilePageState());

  void onBackMainScreen() {
    navigator.onBackMainScreen();
  }

  List<ProgressTimeProfile> dataDemo(){
    List<ProgressTimeProfile> list = [
      ProgressTimeProfile(id: "1", strTime: "06/14",totalTask: 0.7,
          color: AppColors.text_purple),
      ProgressTimeProfile(id: "2", strTime: "06/15",totalTask: 0.01,
          color: AppColors.color_red_button),
      ProgressTimeProfile(id: "3", strTime: "06/16",totalTask: 0.6,
          color: AppColors.text_purple),
      ProgressTimeProfile(id: "4", strTime: "06/17",totalTask: 0.5,
          color: AppColors.text_purple),
      ProgressTimeProfile(id: "5", strTime: "06/18",totalTask: 0.4,
          color: AppColors.text_purple),
      ProgressTimeProfile(id: "6", strTime: "06/19",totalTask: 0.9,
          color: AppColors.text_purple),
      ProgressTimeProfile(id: "7", strTime: "06/20",totalTask: 0.5,
          color: AppColors.text_purple),
      ProgressTimeProfile(id: "8", strTime: "Today",totalTask: 0.7,
          color: AppColors.color_button_oragne),
    ];
    return list;
  }
}