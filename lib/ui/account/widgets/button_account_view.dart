import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monumental_habit_app/services/app_colors.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';

class ButtonAccountView extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ButtonAccountView({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: AppHelpers.getSizeWithDevice(context),
        height: 60,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.color_button_oragne
          ),
          child: Center(
            child:Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.text_purple,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  fontFamily: AppHelpers.POPPINS_FONT),
            ),
          ),
        ),
      ),
    );
  }
}
