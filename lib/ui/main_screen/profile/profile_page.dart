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
import 'package:monumental_habit_app/ui/main_screen/profile/profile_page_cubit.dart';
import 'package:monumental_habit_app/ui/main_screen/profile/profile_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/profile/profile_page_state.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ProfilePageCubit(
          navigator: ProfilePageNavigator(context: context),
        );
      },
      child: const ProfilePageChildPage(),
    );
  }
}

class ProfilePageChildPage extends StatefulWidget {
  const ProfilePageChildPage({super.key});

  @override
  State<ProfilePageChildPage> createState() => _ProfilePageChildPageState();
}

class _ProfilePageChildPageState extends State<ProfilePageChildPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageCubit, ProfilePageState>(
        builder: (context, state) {
      return Scaffold(
        extendBody: true,
        backgroundColor: Colors.yellow,
        body: GestureDetector(),
      );
    });
  }
}
