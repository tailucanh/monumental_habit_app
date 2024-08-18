import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monumental_habit_app/models/habit_frequency.dart';
import 'package:monumental_habit_app/services/app_colors.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:monumental_habit_app/services/app_language_constants.dart';
import 'package:monumental_habit_app/ui/main_screen/habit/widgets/rounded_triangle.dart';

class HabitFrequencyItem extends StatelessWidget {
  final HabitFrequency data;

  const HabitFrequencyItem({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 55,
      child: DecoratedBox(
        decoration: const BoxDecoration(
            border: Border(
                right: BorderSide(color: AppColors.gradient_home, width: 1))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              data.strDay.toUpperCase(),
              style: TextStyle(
                  color: AppColors.text_purple.withAlpha(50),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppHelpers.POPPINS_FONT),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 38,
              height: 38,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: AppColors.color_floating_button.withAlpha(20),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:const EdgeInsets.all(3),
                  child: data.percentage >= 50.0
                      ? SizedBox(
                          width: 38,
                          height: 38,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppColors.color_floating_button,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        )
                      : CustomPaint(
                          size: const Size(38, 38),
                          painter: RoundedTrianglePainter(
                              color: AppColors.color_floating_button,
                              radius: 12),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
