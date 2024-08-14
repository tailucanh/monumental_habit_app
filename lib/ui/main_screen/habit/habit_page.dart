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
import 'package:monumental_habit_app/ui/main_screen/habit/habit_page_cubit.dart';
import 'package:monumental_habit_app/ui/main_screen/habit/habit_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/habit/habit_page_state.dart';


class HabitPage extends StatelessWidget {
  const HabitPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HabitPageCubit(
          navigator: HabitPageNavigator(context: context),
        );
      },
      child: const HabitPageChildPage(),
    );
  }
}

class HabitPageChildPage extends StatefulWidget {
  const HabitPageChildPage({super.key});

  @override
  State<HabitPageChildPage> createState() => _HabitPageChildPageState();
}

class _HabitPageChildPageState extends State<HabitPageChildPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitPageCubit, HabitPageState>(
        builder: (context, state) {
      return Scaffold(
        extendBody: true,
        backgroundColor: Colors.purple,
        body: GestureDetector(),
      );
    });
  }
}
