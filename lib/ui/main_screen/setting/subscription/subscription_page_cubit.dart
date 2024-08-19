import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/subscription/subscription_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/subscription/subscription_page_state.dart';

class SubscriptionPageCubit extends Cubit<SubscriptionPageState> {
  final SubscriptionPageNavigator navigator;

  SubscriptionPageCubit({
    required this.navigator,
  }) : super(const SubscriptionPageState());


  void onBackPage() {
    navigator.onBackPage();
  }


}