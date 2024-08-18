import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'app_colors.dart';
import 'app_language_constants.dart';


enum LoadStatus { loading, success, failure, initial }

class AppHelpers {

  static const String POPPINS_FONT = "Poppins";
  static const String KLASIK_FONT = "Klasik";
  static const String KEY_ONBOADRING_SCREEN = "onboarding_screen";
  static const String KEY_LOGIN_SCREEN = "login_screen";
  static const String KEY_SIGN_UP_SCREEN ="sign_up_screen";
  static const String KEY_FORGOT_PASSWORD_SCREEN ="forgot_password_screen";
  static const String KEY_HOME_SCREEN ="home_screen";

  static const String KEY_LIST_HABIT_FREQUENCY ="list_habit_frequency";


  static List<String> titleSliders(BuildContext context){
    List<String> list = [
      translation(context).text_slider_1.toUpperCase(),
      translation(context).text_slider_2.toUpperCase(),
      translation(context).text_slider_3.toUpperCase(),
      translation(context).text_slider_4.toUpperCase()
    ];
    return list;
  }

  static double getSizeWithDevice(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double getSizeHeightDevice(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static double getHeightStatusBarDevice(BuildContext context){
    return MediaQuery.of(context).padding.top;
  }

  static bool isStringNotEmpty(String input) {
    if (input.isNotEmpty) {
      return true;
    }
    return false;
  }

  static bool isStringContains(String input,String value) {
    if (input.contains(value)) {
      return true;
    }
    return false;
  }

  static Widget uiLoading(BuildContext context, bool isLoading){
    return  isLoading ? SizedBox(
      width: AppHelpers.getSizeWithDevice(context),
      height: AppHelpers.getSizeHeightDevice(context),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Center(
          child: LoadingAnimationWidget.dotsTriangle(
            color: AppColors.color_loading,
            size: 100,
          ),
        ),
      ),
    ): const SizedBox();
  }

  /*static popupPermission({required BuildContext context, required VoidCallback onAllow}){
      showDialog(
          context: context,
          //barrierDismissible: false,
          builder:(BuildContext context){
            return AlertDialog(
              content: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppAssets.icLocation,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    Text(translation(context).title_dialog_location,
                      style: TextStyle(
                          color: AppColors.dark_primary,
                          fontSize: 20,
                          height: 1,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppHelpers.POPPINS_FONT),),
                    const SizedBox(height: 15),
                    Text(translation(context).description_dialog_location,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.dark_secondary,
                          fontSize: 16,
                          height: 1,
                          fontStyle: FontStyle.normal,
                          fontFamily: AppHelpers.POPPINS_FONT),),
                    Container(
                      width: AppHelpers.getSizeWithDevice(context),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [ AppColors.gradient_blue_5, AppColors.gradient_purple_3],
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: onAllow,
                        style:  ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          backgroundColor: AppColors.color_white_0
                        ),
                        child: Text(translation(context).text_allow,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.light_primary,
                              fontSize: 16,
                              height: 1,
                              fontStyle: FontStyle.normal,
                              fontFamily: AppHelpers.POPPINS_FONT),),
                      ),
                    ),
                    Container(
                      width: AppHelpers.getSizeWithDevice(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.color_border, width: 2)
                      ),
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style:  ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        child: Text(translation(context).text_skip,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.dark_primary,
                              fontSize: 16,
                              height: 1,
                              fontStyle: FontStyle.normal,
                              fontFamily: AppHelpers.POPPINS_FONT),),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
      );
  }*/

}

