import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monumental_habit_app/services/app_assets.dart';
import 'package:monumental_habit_app/services/app_language_constants.dart';
import 'package:monumental_habit_app/services/app_shared_preference.dart';
import '../../services/app_colors.dart';
import '../../services/app_helpers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 3), () {
        if(appSharedPreference.isOnboarding){
          context.go('/${AppHelpers.KEY_LOGIN_SCREEN}');
        }else {
          context.go('/${AppHelpers.KEY_ONBOADRING_SCREEN}');
        }
      });
    });

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              AppAssets.imageSplash,
              width: AppHelpers.getSizeWithDevice(context),
              height: AppHelpers.getSizeHeightDevice(context),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: AppHelpers.getHeightStatusBarDevice(context) + 30,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(translation(context).text_welcome,
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                      color: AppColors.text_purple,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppHelpers.KLASIK_FONT),),
              )
          )
        ],
      ),
    );
  }
}
