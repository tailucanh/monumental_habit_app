import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monumental_habit_app/models/progress_time_profile.dart';
import 'package:monumental_habit_app/services/app_colors.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ItemProgressTask extends StatelessWidget {
  final ProgressTimeProfile data;

  const ItemProgressTask({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 5.0,
              animation: true,
              percent: data.totalTask,
              center: Text(
                (data.totalTask * 10).floor().toString(),
                style:  TextStyle(
                    color: data.color,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: AppHelpers.KLASIK_FONT),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: data.color,
              backgroundColor: data.color.withAlpha(50),
              animationDuration: 1000,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              data.strTime,
              textAlign: TextAlign.left,
              maxLines: 1,
              style: TextStyle(
                  color: AppColors.text_purple.withAlpha(50),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontFamily: AppHelpers.POPPINS_FONT),
            ),
          ),
        ],
      ),
    );
  }
}
