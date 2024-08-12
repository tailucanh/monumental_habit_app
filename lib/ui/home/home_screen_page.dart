import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:monumental_habit_app/ui/home/home_screen_state.dart';
import 'home_screen_cubit.dart';
import 'home_screen_navigator.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeScreenCubit(
          navigator: HomeScreenNavigator(context: context),
        );
      },
      child: const HomeScreenChildPage(),
    );
  }
}
class HomeScreenChildPage extends StatefulWidget {
  const HomeScreenChildPage({super.key});

  @override
  State<HomeScreenChildPage> createState() => _HomeScreenChildPageState();
}

class _HomeScreenChildPageState extends State<HomeScreenChildPage> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(builder: (context, state) {
      return  Scaffold(
        extendBody: true,
        body: GestureDetector(
        ),
      );
    });

  }

}

