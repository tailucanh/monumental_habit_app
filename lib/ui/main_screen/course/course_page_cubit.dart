import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:monumental_habit_app/ui/main_screen/course/course_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/course/course_page_state.dart';
import 'package:monumental_habit_app/ui/main_screen/home/home_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/home/home_page_state.dart';

class CoursePageCubit extends Cubit<CoursePageState> {
  final CoursePageNavigator navigator;

  CoursePageCubit({
    required this.navigator,
  }) : super(const CoursePageState());

}