import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monumental_habit_app/models/purchase_package_profile.dart';
import 'package:monumental_habit_app/services/app_colors.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:monumental_habit_app/ui/main_screen/habit/widgets/rounded_triangle.dart';

class ItemPurchasePackage extends StatelessWidget {
  final PurchasePackageProfile data;
  final VoidCallback onPressed;

  const ItemPurchasePackage({
    super.key,
    required this.data,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: AppHelpers.isStringNotEmpty(data.title) ? 155 : 135,
        width: AppHelpers.getSizeWithDevice(context),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: AppColors.light_primary,
              borderRadius: BorderRadius.circular(12)),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AppHelpers.isStringNotEmpty(data.title)
                      ? SizedBox(
                          height: 33,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              color: AppColors.color_button_oragne,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: AutoSizeText(
                                  data.title,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  minFontSize: 7,
                                  maxFontSize: 12,
                                  style: const TextStyle(
                                      color: AppColors.text_purple,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppHelpers.POPPINS_FONT),
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: AppHelpers.isStringNotEmpty(data.title) ? 10 : 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: AutoSizeText(
                      "\$ ${data.price.toString()}",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      minFontSize: 7,
                      maxFontSize: 24,
                      style: const TextStyle(
                          color: AppColors.color_text_field,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppHelpers.POPPINS_FONT),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: AutoSizeText(
                      data.contentPrice,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      minFontSize: 5,
                      maxFontSize: 10,
                      style: TextStyle(
                          color: AppColors.text_purple.withAlpha(50),
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          fontFamily: AppHelpers.POPPINS_FONT),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: AppColors.gradient_home, width: 1))),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: AutoSizeText(
                      data.strTime,
                      textAlign: (data.discount != 0)
                          ? TextAlign.start
                          : TextAlign.center,
                      maxLines: 2,
                      minFontSize: 8,
                      maxFontSize: 12,
                      style: const TextStyle(
                          color: AppColors.text_purple,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppHelpers.POPPINS_FONT),
                    ),
                  ),
                ),
              ),
              (data.discount != 0)
                  ? Positioned(
                      bottom: 0,
                      right: 0,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomRight:  Radius.circular(12)
                            ),
                            child: CustomPaint(
                              size: const Size(55, 55),
                              painter: RoundedTrianglePainter(
                                  color: AppColors.color_floating_button,
                                  radius: 12,
                                  rotate: true, isRadius: false),
                            ),
                          ),
                          Positioned(
                            bottom: 12,
                            right: 2,
                            child: Transform.rotate(
                              angle: -(45 * (3.14 / 180)),
                              child: Text(
                                "${data.discount} %",
                                maxLines: 1,
                                style: const TextStyle(
                                    color: AppColors.text_purple,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppHelpers.POPPINS_FONT),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
