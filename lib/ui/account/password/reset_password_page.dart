import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:monumental_habit_app/services/app_assets.dart';
import 'package:monumental_habit_app/services/app_colors.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:monumental_habit_app/services/app_language_constants.dart';
import 'package:monumental_habit_app/ui/account/login/login_cubit.dart';
import 'package:monumental_habit_app/ui/account/login/login_navigator.dart';
import 'package:monumental_habit_app/ui/account/login/login_state.dart';
import 'package:monumental_habit_app/ui/account/password/reset_password_cubit.dart';
import 'package:monumental_habit_app/ui/account/password/reset_password_navigator.dart';
import 'package:monumental_habit_app/ui/account/password/reset_password_state.dart';
import 'package:monumental_habit_app/ui/account/signup/sign_up_cubit.dart';
import 'package:monumental_habit_app/ui/account/signup/sign_up_navigator.dart';
import 'package:monumental_habit_app/ui/account/widgets/button_account_view.dart';
import 'package:monumental_habit_app/ui/account/widgets/text_field_account_view.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ResetPasswordCubit(
          navigator: ResetPasswordNavigator(context: context),
        );
      },
      child: const ResetPasswordPageChildPage(),
    );
  }
}

class ResetPasswordPageChildPage extends StatefulWidget {
  const ResetPasswordPageChildPage({super.key});

  @override
  State<ResetPasswordPageChildPage> createState() =>
      _ResetPasswordPageChildPageState();
}

class _ResetPasswordPageChildPageState
    extends State<ResetPasswordPageChildPage> {
  late final ResetPasswordCubit _cubit;
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _focusNodeEmail = FocusNode();

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
    _cubit.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        builder: (context, state) {
      return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.gradient_home,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: AppHelpers.getHeightStatusBarDevice(context) + 20,
                    left: 20),
                child: InkWell(
                  onTap: () =>
                      context.read<ResetPasswordCubit>().onBackLoginPage(),
                  borderRadius: BorderRadius.circular(90),
                  child: SizedBox(
                    width: 44,
                    height: 44,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.text_purple.withAlpha(20)),
                      child: const Center(
                        child: FaIcon(
                          Icons.arrow_back_outlined,
                          size: 25,
                          color: AppColors.text_purple,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      translation(context).text_title_forgot_password,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: const TextStyle(
                          color: AppColors.text_purple,
                          fontSize: 24,
                          fontFamily: AppHelpers.KLASIK_FONT),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Center(
                    child: Image.asset(
                  AppAssets.imageBoxForgotPass,
                  width: AppHelpers.getSizeWithDevice(context),
                  height: 250,
                  fit: BoxFit.cover,
                )),
              ),
          
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: SizedBox(
                  width: AppHelpers.getSizeWithDevice(context),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.light_primary,
                      borderRadius:  BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            translation(context).text_content_forgot_password,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: AppColors.text_purple,
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                                fontFamily: AppHelpers.POPPINS_FONT),
                          ),
                          const SizedBox(height: 25,),
                          TextFieldAccountView(
                            icon: Icons.email_outlined,
                            hint: translation(context)
                                .text_hint_email,
                            isPassword: false,
                            controller: _emailController,
                            focusNode: _focusNodeEmail,
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 10,),
                          ButtonAccountView(
                            title: translation(context)
                                .text_button_forgot_password,
                            onPressed: () => {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
