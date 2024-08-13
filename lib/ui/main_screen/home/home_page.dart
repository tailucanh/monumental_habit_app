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
import 'package:monumental_habit_app/ui/main_screen/home/home_page_cubit.dart';
import 'package:monumental_habit_app/ui/main_screen/home/home_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/home/home_page_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomePageCubit(
          navigator: HomePageNavigator(context: context),
        );
      },
      child: const HomePageChildPage(),
    );
  }
}

class HomePageChildPage extends StatefulWidget {
  const HomePageChildPage({super.key});

  @override
  State<HomePageChildPage> createState() => _HomePageChildPageState();
}

class _HomePageChildPageState extends State<HomePageChildPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
      return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.gradient_home,
        body: GestureDetector(),
      );
    });
  }
}
