import 'dart:async';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:monumental_habit_app/services/app_assets.dart';
import 'package:monumental_habit_app/services/app_colors.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:monumental_habit_app/services/app_language_constants.dart';
import 'package:monumental_habit_app/services/countdown_timer.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/subscription/subscription_page_cubit.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/subscription/subscription_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/subscription/subscription_page_state.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/subscription/widgets/item_purchase_package.dart';

import 'package:monumental_habit_app/ui/main_screen/setting/widget/item_setting.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SubscriptionPageCubit(
          navigator: SubscriptionPageNavigator(context: context),
        );
      },
      child: const SubscriptionPageChildPage(),
    );
  }
}

class SubscriptionPageChildPage extends StatefulWidget {
  const SubscriptionPageChildPage({super.key});

  @override
  State<SubscriptionPageChildPage> createState() =>
      _SubscriptionPageChildPageState();
}

class _SubscriptionPageChildPageState extends State<SubscriptionPageChildPage> {
  late CountdownTimer _countdownTimer;
  String _timeHours = '';
  String _timeMinutes = '';
  String _timeSeconds = '';

  @override
  void initState() {
    super.initState();
    _countdownTimer = CountdownTimer(onTick: _updateTimeLeft);
    _countdownTimer.start(_onTimerReset);
    _updateTimeLeft();
  }

  void _onTimerReset() {
    _updateTimeLeft();
  }

  void _updateTimeLeft() {
    setState(() {
      _timeHours = _countdownTimer.getTimeHours();
      _timeMinutes = _countdownTimer.getTimeMinutes();
      _timeSeconds = _countdownTimer.getTimeSeconds();
    });
  }

  @override
  void dispose() {
    _countdownTimer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionPageCubit, SubscriptionPageState>(
        builder: (context, state) {
      return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.gradient_home,
        body: Padding(
          padding: EdgeInsets.only(
            top: AppHelpers.getHeightStatusBarDevice(context) + 25,
            left: 20,
            right: 20,
          ),
          child: ClipRRect(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                _uiAppBar(
                    onTapBack: () =>
                        context.read<SubscriptionPageCubit>().onBackPage()),

                Expanded(
                  child: SingleChildScrollView(
                    padding:const EdgeInsets.only(top: 30, bottom: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                         _uiBannerSetting(
                            percent: 60,
                            timeHours: _timeHours,
                            timeMinutes: _timeMinutes,
                            timeSeconds: _timeSeconds),
                        const SizedBox(
                          height: 10,
                        ),
                        _uiUnlock(),

                        // ui list purchase
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: ItemPurchasePackage(
                                  data: context
                                      .read<SubscriptionPageCubit>()
                                      .dataPurchase(context)[0],
                                  onPressed: () {},
                                )),
                            const SizedBox(width: 8,),
                            Expanded(
                                flex: 1,
                                child: ItemPurchasePackage(
                                  data: context
                                      .read<SubscriptionPageCubit>()
                                      .dataPurchase(context)[1],
                                  onPressed: () {},
                                )),
                            const SizedBox(width: 8,),
                            Expanded(
                                flex: 1,
                                child: ItemPurchasePackage(
                                  data: context
                                      .read<SubscriptionPageCubit>()
                                      .dataPurchase(context)[2],
                                  onPressed: () {},
                                ))
                          ],
                        ),
                        // UI footer bar
                        const SizedBox(
                          height: 35,
                        ),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            width: AppHelpers.getSizeWithDevice(context),
                            height: 60,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.color_button_oragne,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  translation(context)
                                      .text_premium_subscribe_button,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: AppColors.text_purple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppHelpers.POPPINS_FONT),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: AppHelpers.getSizeWithDevice(context) / 1.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const FaIcon(Icons.security_rounded,
                                  color: AppColors.text_purple, size: 25),
                              Expanded(
                                child: Text(
                                  translation(context)
                                      .text_premium_content_secured,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: AppColors.text_purple,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: AppHelpers.POPPINS_FONT),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(5),
                          child: Text(
                            translation(context).text_premium_purchase,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: AppColors.color_text_field,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.color_text_field,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppHelpers.POPPINS_FONT),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(5),
                              child: Text(
                                translation(context).text_premium_service,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColors.text_purple,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.text_purple,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppHelpers.POPPINS_FONT),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                translation(context).text_premium_and,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.text_purple.withAlpha(60),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppHelpers.POPPINS_FONT),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(5),
                              child: Text(
                                translation(context).text_premium_privacy,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColors.text_purple,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.text_purple,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppHelpers.POPPINS_FONT),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _uiAppBar({required GestureTapCallback onTapBack}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTapBack,
          borderRadius: BorderRadius.circular(80),
          child: const SizedBox(
            height: 44,
            width: 44,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.purple_shadow),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: AppColors.text_purple,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 60),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                translation(context).text_premium,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: const TextStyle(
                    color: AppColors.text_purple,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppHelpers.POPPINS_FONT),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _uiBannerSetting(
      {required int percent,
      required String timeHours,
      required String timeMinutes,
      required String timeSeconds}) {
    return SizedBox(
      width: AppHelpers.getSizeWithDevice(context),
      height: 150,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.light_primary),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "${percent.toString()}% ${translation(context).text_title_premium_banner}",
                    textAlign: TextAlign.start,
                    minFontSize: 10,
                    stepGranularity: 1.0,
                    maxLines: 1,
                    style: const TextStyle(
                        color: AppColors.color_text_field,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppHelpers.POPPINS_FONT),
                  ),
                  AutoSizeText(
                    translation(context).text_content_premium_banner,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    minFontSize: 10,
                    style: TextStyle(
                        color: AppColors.text_purple.withAlpha(50),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontFamily: AppHelpers.POPPINS_FONT),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: AppColors.text_purple.withAlpha(30),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: Text(
                            timeHours,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: const TextStyle(
                                color: AppColors.text_purple,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppHelpers.POPPINS_FONT),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          ":",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                              color: AppColors.text_purple,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppHelpers.POPPINS_FONT),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: AppColors.text_purple.withAlpha(30),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: Text(
                            timeMinutes,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: const TextStyle(
                                color: AppColors.text_purple,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppHelpers.POPPINS_FONT),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          ":",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                              color: AppColors.text_purple,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppHelpers.POPPINS_FONT),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: AppColors.text_purple.withAlpha(30),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: Text(
                            timeSeconds,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: const TextStyle(
                                color: AppColors.text_purple,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppHelpers.POPPINS_FONT),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
              SizedBox(
                height: 150,
                width: AppHelpers.getSizeWithDevice(context) / 2.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    AppAssets.imageTeepeeSwirly,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _uiUnlock() {
    return SizedBox(
      width: AppHelpers.getSizeWithDevice(context),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: AppColors.light_primary,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  translation(context).text_title_unlock_premium,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(
                      color: AppColors.text_purple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppHelpers.POPPINS_FONT),
                ),
              ),
            ),
            const Divider(
              color: AppColors.gradient_home,
              height: 1,
            ),
            _uiItemUnlock(
                content: translation(context).text_content_unlock_premium_1),
            const Divider(
              color: AppColors.gradient_home,
              height: 1,
            ),
            _uiItemUnlock(
                content: translation(context).text_content_unlock_premium_2),
            const Divider(
              color: AppColors.gradient_home,
              height: 1,
            ),
            _uiItemUnlock(
                content: translation(context).text_content_unlock_premium_3),
          ],
        ),
      ),
    );
  }

  Widget _uiItemUnlock({required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 22,
            height: 22,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.color_floating_button),
              child: Center(
                child: FaIcon(
                  Icons.check_rounded,
                  size: 15,
                  color: AppColors.text_purple,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: AutoSizeText(
                content,
                textAlign: TextAlign.start,
                maxLines: 1,
                maxFontSize: 16,
                minFontSize: 12,
                style: const TextStyle(
                    color: AppColors.text_purple,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontFamily: AppHelpers.POPPINS_FONT),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
