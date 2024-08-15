import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monumental_habit_app/services/app_colors.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:monumental_habit_app/services/app_language_constants.dart';

class ItemSetting extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final VoidCallback onPressed;

  const ItemSetting({
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
        height: 75,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: AppColors.light_primary,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          title,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: const TextStyle(
                              color: AppColors.text_purple,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              fontFamily: AppHelpers.POPPINS_FONT),
                        ),
                      ),
                      AppHelpers.isStringNotEmpty(content) ?
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          content,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: TextStyle(
                              color: AppColors.text_purple.withAlpha(50),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              fontFamily: AppHelpers.POPPINS_FONT),
                        ),
                      ): const SizedBox(),
                    ],
                  ),
                )),
                const SizedBox(
                  child: FaIcon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: AppColors.text_purple,
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
