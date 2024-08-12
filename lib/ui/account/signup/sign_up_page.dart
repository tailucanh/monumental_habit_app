import 'dart:async';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:monumental_habit_app/services/app_assets.dart';
import 'package:monumental_habit_app/services/app_colors.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:monumental_habit_app/services/app_language_constants.dart';
import 'package:monumental_habit_app/ui/account/login/login_cubit.dart';
import 'package:monumental_habit_app/ui/account/login/login_navigator.dart';
import 'package:monumental_habit_app/ui/account/login/login_state.dart';
import 'package:monumental_habit_app/ui/account/password/reset_password_state.dart';
import 'package:monumental_habit_app/ui/account/signup/sign_up_cubit.dart';
import 'package:monumental_habit_app/ui/account/signup/sign_up_navigator.dart';
import 'package:monumental_habit_app/ui/account/signup/sign_up_state.dart';
import 'package:monumental_habit_app/ui/account/widgets/button_account_view.dart';
import 'package:monumental_habit_app/ui/account/widgets/text_field_account_view.dart';

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

class _SignUpPageChildPageState extends State<SignUpPageChildPage> {
  late final SignUpCubit _cubit;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _focusNodeName = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

  bool _isCheckKeep = false;
  bool _isCheckSendEmail = false;

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
      return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.gradient_home,
        body: Padding(
          padding: EdgeInsets.only(
              top: AppHelpers.getHeightStatusBarDevice(context) + 30,
              left: 20,
              right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Image.asset(
                  AppAssets.imageCreateAccount,
                  width: AppHelpers.getSizeWithDevice(context) / 1.75,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 25, left: 20, right: 20, bottom: 25),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      translation(context).text_create_account,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: const TextStyle(
                          color: AppColors.text_purple,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppHelpers.KLASIK_FONT),
                    ),
                  ),
                ),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFieldAccountView(
                        icon: Icons.person_outline_rounded,
                        hint: translation(context).text_hint_name,
                        colorBackground: AppColors.light_primary,
                        isPassword: false,
                        controller: _nameController,
                        focusNode: _focusNodeName,
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldAccountView(
                        icon: Icons.email_outlined,
                        hint: translation(context).text_hint_email,
                        colorBackground: AppColors.light_primary,
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
                        hint: translation(context).text_hint_password,
                        colorBackground: AppColors.light_primary,
                        controller: _passwordController,
                        focusNode: _focusNodePassword,
                        isPassword: true,
                        onChanged: (value) {},
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _uiCheckBox(
                                title: translation(context).text_check_box_sign_in,
                                isSwitch: _isCheckKeep,
                                onChange: (newValue) {
                                  setState(() {
                                    _isCheckKeep = newValue ?? false;
                                  });
                                }),
                            _uiCheckBox(
                                title: translation(context).text_check_box_email,
                                isSwitch: _isCheckSendEmail,
                                onChange: (newValue) {
                                  setState(() {
                                    _isCheckSendEmail = newValue ?? false;
                                  });
                                }),
                          ],
                        ),
                      ),
                      ButtonAccountView(
                        title: translation(context).text_sign_up_button,
                        onPressed: () => {},
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(
                                child: Opacity(
                                    opacity: 0.3,
                                    child: Divider(
                                      height: 1,
                                      color: AppColors.text_purple,
                                    ))),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                translation(context).text_content_other_sign_in,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: const TextStyle(
                                    color: AppColors.text_purple,
                                    fontSize: 14,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: AppHelpers.POPPINS_FONT),
                              ),
                            ),
                            const Expanded(
                                child: Opacity(
                                    opacity: 0.3,
                                    child: Divider(
                                      height: 1,
                                      color: AppColors.text_purple,
                                    ))),
                          ],
                        ),
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _uiButtonSignIn(title: "Google", icon: AppAssets.icGoogle, onPressed: () {}),
                          const SizedBox(width: 8,),
                          _uiButtonSignIn(title: "FaceBook", icon: AppAssets.icFaceBook, onPressed: () {}),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 35, bottom: 30),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${translation(context).text_content_login} ",
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
                                  .read<SignUpCubit>()
                                  .onBackLoginPage(),
                              child: Text(
                                translation(context)
                                    .text_sign_in,
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _uiCheckBox(
      {required String title,
      required bool isSwitch,
      required ValueChanged<bool?> onChange}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: isSwitch,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          checkColor: Colors.white,
          activeColor: AppColors.color_button_oragne,
          onChanged: onChange,
        ),
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: const TextStyle(
                color: AppColors.text_purple,
                fontSize: 16,
                fontStyle: FontStyle.normal,
                fontFamily: AppHelpers.POPPINS_FONT),
          ),
        ),
      ],
    );
  }


  Widget _uiButtonSignIn({required String title,required String icon,required VoidCallback onPressed}){
    return  Expanded(
      flex: 1,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.light_primary
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(icon, width: 23,height: 23, fit: BoxFit.cover,),
                const SizedBox(width: 8,),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(
                      color: AppColors.text_purple,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppHelpers.POPPINS_FONT),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
