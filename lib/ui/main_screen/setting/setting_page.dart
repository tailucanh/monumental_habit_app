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
import 'package:monumental_habit_app/ui/main_screen/setting/setting_page_cubit.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/setting_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/setting_page_state.dart';


class SettingPage extends StatelessWidget {
  const SettingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SettingPageCubit(
          navigator: SettingPageNavigator(context: context),
        );
      },
      child: const SettingPageChildPage(),
    );
  }
}

class SettingPageChildPage extends StatefulWidget {
  const SettingPageChildPage({super.key});

  @override
  State<SettingPageChildPage> createState() => _SettingPageChildPageState();
}

class _SettingPageChildPageState extends State<SettingPageChildPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingPageCubit, SettingPageState>(
        builder: (context, state) {
      return Scaffold(
        extendBody: true,
        backgroundColor: Colors.pink,
        body: GestureDetector(),
      );
    });
  }
}
