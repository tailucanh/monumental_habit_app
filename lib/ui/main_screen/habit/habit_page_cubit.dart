import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monumental_habit_app/ui/main_screen/habit/habit_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/habit/habit_page_state.dart';

class HabitPageCubit extends Cubit<HabitPageState> {
  final HabitPageNavigator navigator;

  HabitPageCubit({
    required this.navigator,
  }) : super(const HabitPageState());

}