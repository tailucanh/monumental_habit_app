import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monumental_habit_app/models/habit_frequency.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:monumental_habit_app/ui/main_screen/habit/habit_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/habit/habit_page_state.dart';

class HabitPageCubit extends Cubit<HabitPageState> {
  final HabitPageNavigator navigator;

  HabitPageCubit({
    required this.navigator,
  }) : super(const HabitPageState());

  Future<void> loadInitialData() async {
    emit(state.copyWith(loadDataStatus: LoadStatus.initial));
    try {
      emit(state.copyWith(loadDataStatus: LoadStatus.success));
    } catch (e) {
      emit(state.copyWith(loadDataStatus: LoadStatus.failure));
    }
  }


    List<HabitFrequency> dataHabits(){
    List<HabitFrequency> list = [
      HabitFrequency(id: "1", strDay: "Sun",percentage: 80 ),
      HabitFrequency(id: "2", strDay: "Mon",percentage: 40 ),
      HabitFrequency(id: "3", strDay: "Tue",percentage: 35 ),
      HabitFrequency(id: "4", strDay: "Wed",percentage: 100 ),
      HabitFrequency(id: "5", strDay: "Thu",percentage: 45 ),
      HabitFrequency(id: "6", strDay: "Fri",percentage: 70 ),
      HabitFrequency(id: "7", strDay: "Sat",percentage: 60 ),
    ];
    return list;
  }
}