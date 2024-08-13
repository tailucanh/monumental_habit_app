import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:monumental_habit_app/services/app_assets.dart';
import 'package:monumental_habit_app/services/app_colors.dart';
import 'package:monumental_habit_app/ui/main_screen/course/course_page_cubit.dart';
import 'package:monumental_habit_app/ui/main_screen/course/course_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/course/course_page_state.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CoursePageCubit(
          navigator: CoursePageNavigator(context: context),
        );
      },
      child: const CoursePageChildPage(),
    );
  }
}

class CoursePageChildPage extends StatefulWidget {
  const CoursePageChildPage({super.key});

  @override
  State<CoursePageChildPage> createState() => _CoursePageChildPageState();
}

class _CoursePageChildPageState extends State<CoursePageChildPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursePageCubit, CoursePageState>(
        builder: (context, state) {
      return Scaffold(
        extendBody: true,
        backgroundColor: Colors.blue,
        body: GestureDetector(),
      );
    });
  }
}
