import 'package:flutter/material.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:monumental_habit_app/services/app_language_constants.dart';

import '../../../services/app_colors.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String image;

  const SliderPage({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppHelpers.getHeightStatusBarDevice(context) + 15),
      child: SizedBox(
        width: AppHelpers.getSizeWithDevice(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(title,
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                      color: AppColors.text_purple,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppHelpers.KLASIK_FONT),),
              ),
            ),
            Expanded(
              flex: 5,
              child: Image.asset(image,
                width: AppHelpers.getSizeWithDevice(context),
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: RichText (
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: translation(context).text_slider_content_1.toUpperCase(),
                      style: const TextStyle(
                          color: AppColors.text_purple,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppHelpers.POPPINS_FONT
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: translation(context).text_slider_content_2.toUpperCase(),
                          style: const TextStyle(
                              color: AppColors.rick_text_orange,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppHelpers.POPPINS_FONT
                          ),
                        ),
                        TextSpan(
                          text: translation(context).text_slider_content_3.toUpperCase(),
                          style: const TextStyle(
                              color: AppColors.text_purple,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppHelpers.POPPINS_FONT
                          ),
                        ),
                        TextSpan(
                          text: translation(context).text_slider_content_4.toUpperCase(),
                          style: const TextStyle(
                              color: AppColors.rick_text_orange,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppHelpers.POPPINS_FONT
                          ),
                        ),
                      ])
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
