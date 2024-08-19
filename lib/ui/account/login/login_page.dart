import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:monumental_habit_app/ui/account/widgets/button_account_view.dart';
import 'package:monumental_habit_app/ui/account/widgets/text_field_account_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LoginCubit(
          navigator: LoginNavigator(context: context),
        );
      },
      child: const LoginChildPage(),
    );
  }
}

class LoginChildPage extends StatefulWidget {
  const LoginChildPage({super.key});

  @override
  State<LoginChildPage> createState() => _LoginChildPageState();
}

class _LoginChildPageState extends State<LoginChildPage> {
  late final LoginCubit _cubit;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
    _cubit.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, loginCubit) {
      return PopScope(
        canPop: true,
        onPopInvoked: (didPop) {},
        child: Scaffold(
          extendBody: true,
          backgroundColor: AppColors.gradient_home,
          body: Stack(
            children: [
              Positioned(
                top: AppHelpers.getHeightStatusBarDevice(context),
                left: 0,
                right: 0,
                child: Stack(
                  children: [
                    Image.asset(
                      AppAssets.imageSplash,
                      width: AppHelpers.getSizeWithDevice(context),
                      height: AppHelpers.getSizeHeightDevice(context) / 2.1,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: AppHelpers.getSizeWithDevice(context),
                      height: AppHelpers.getSizeHeightDevice(context) / 2.1,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.gradient_home_transparent,
                              AppColors.gradient_home
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: AppHelpers.getHeightStatusBarDevice(context) + 20,
                  right: 20,
                  child: InkWell(
                    onTap: () => {},
                    child: SizedBox(
                      width: 44,
                      height: 44,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.text_purple.withAlpha(20)),
                        child: const Text(
                          "?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.text_purple,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppHelpers.KLASIK_FONT),
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: AppHelpers.getSizeWithDevice(context),
                    height: AppHelpers.getSizeHeightDevice(context) / 1.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                translation(context).text_welcome,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColors.text_purple,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppHelpers.KLASIK_FONT),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            _buttonLogin(
                                title: translation(context).text_login_google,
                                icon: AppAssets.icGoogle,
                                onTap: () {}),
                            const SizedBox(
                              height: 8,
                            ),
                            _buttonLogin(
                                title: translation(context).text_login_facebook,
                                icon: AppAssets.icFaceBook,
                                onTap: () {}),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: AppHelpers.getSizeWithDevice(context),
                            decoration: const BoxDecoration(
                                color: AppColors.light_primary,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: ClipRRect(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15,
                                        left: 40,
                                        right: 40,
                                        bottom: 10),
                                    child: Text(
                                      translation(context).text_login_email,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: AppColors.text_purple,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: AppHelpers.POPPINS_FONT),
                                    ),
                                  ),
                                  const Divider(
                                    height: 1,
                                    color: AppColors.gradient_home,
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      padding: const EdgeInsets.only(
                                          left: 25,
                                          right: 25,
                                          top: 10,
                                          bottom: 50),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          TextFieldAccountView(
                                            icon: Icons.email_outlined,
                                            hint: translation(context)
                                                .text_hint_email,
                                            isPassword: false,
                                            controller: _emailController,
                                            focusNode: _focusNodeEmail,
                                            onChanged: (value) {},
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextFieldAccountView(
                                            icon: Icons.lock_outline_rounded,
                                            hint: translation(context)
                                                .text_hint_password,
                                            controller: _passwordController,
                                            focusNode: _focusNodePassword,
                                            isPassword: true,
                                            onChanged: (value) {},
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          ButtonAccountView(
                                            title: translation(context)
                                                .text_login_button,
                                            onPressed: () => context.read<LoginCubit>().openHomePage(),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          InkWell(
                                            onTap: () => context
                                                .read<LoginCubit>()
                                                .openForgotPasswordPage(),
                                            child: Text(
                                              translation(context)
                                                  .text_forgot_password,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: AppColors.text_purple,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor: AppColors.text_purple,
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.normal,
                                                  fontFamily:
                                                      AppHelpers.POPPINS_FONT),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${translation(context).text_content_sign_up} ",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color:
                                                        AppColors.text_purple,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: AppHelpers
                                                        .POPPINS_FONT),
                                              ),
                                              InkWell(
                                                onTap: () => context
                                                    .read<LoginCubit>()
                                                    .openSignUpPage(),
                                                child: Text(
                                                  translation(context)
                                                      .text_sign_up,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color:
                                                          AppColors.text_purple,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: AppHelpers
                                                          .POPPINS_FONT),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );
    });
  }

  Widget _buttonLogin(
      {required String title,
      required String icon,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      splashColor: AppColors.light_quaternary,
      child: Container(
        width: AppHelpers.getSizeWithDevice(context) / 1.1,
        height: 50,
        padding: const EdgeInsets.only(left: 40, right: 40),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AppColors.light_primary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 23,
              height: 23,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: const TextStyle(
                      color: AppColors.dark_primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppHelpers.POPPINS_FONT),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
