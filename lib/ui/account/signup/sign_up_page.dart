import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:monumental_habit_app/services/app_assets.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:monumental_habit_app/services/app_language_constants.dart';
import 'package:monumental_habit_app/ui/account/login/login_cubit.dart';
import 'package:monumental_habit_app/ui/account/login/login_navigator.dart';
import 'package:monumental_habit_app/ui/account/login/login_state.dart';
import 'package:monumental_habit_app/ui/account/password/reset_password_state.dart';
import 'package:monumental_habit_app/ui/account/signup/sign_up_cubit.dart';
import 'package:monumental_habit_app/ui/account/signup/sign_up_navigator.dart';
import 'package:monumental_habit_app/ui/account/signup/sign_up_state.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SignUpCubit(
          navigator: SignUpNavigator(context: context),
        );
      },
      child: const SignUpPageChildPage(),
    );
  }
}

class SignUpPageChildPage extends StatefulWidget {
  const SignUpPageChildPage({super.key});

  @override
  State<SignUpPageChildPage> createState() => _SignUpPageChildPageState();
}

class _SignUpPageChildPageState extends State<SignUpPageChildPage>{
  late final SignUpCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
    _cubit.loadInitialData();

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, onBoarding) {
      return PopScope(
        canPop: true,
        onPopInvoked: (didPop) {},
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
            ],
          ),
        ),
      );
    });
  }
}
