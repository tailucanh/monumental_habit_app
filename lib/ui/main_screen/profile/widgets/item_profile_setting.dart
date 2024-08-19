import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monumental_habit_app/services/app_colors.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:monumental_habit_app/services/app_language_constants.dart';

class ItemProfileSetting extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final VoidCallback onPressed;

  const ItemProfileSetting({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: AppHelpers.getSizeWithDevice(context),
        height: 50,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: AppColors.light_primary,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: AppColors.color_button_oragne.withAlpha(40),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: FaIcon(
                        icon,
                        size: 20,
                        color: AppColors.color_button_oragne,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        title,
                        maxLines: 1,
                        style: const TextStyle(
                            color: AppColors.text_purple,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: AppHelpers.POPPINS_FONT),
                      ),
                    ),
                  ),
                )),
                AppHelpers.isStringNotEmpty(content)
                    ? Text(
                        content,
                        textAlign: TextAlign.right,
                        maxLines: 1,
                        style: const TextStyle(
                            color: AppColors.text_purple,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppHelpers.POPPINS_FONT),
                      )
                    : const SizedBox(),

                 SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.text_purple.withAlpha(50), 
                          spreadRadius: -3,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: const FaIcon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                      color: AppColors.text_purple,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
