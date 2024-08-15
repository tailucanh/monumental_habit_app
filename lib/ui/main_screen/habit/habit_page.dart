import 'dart:async';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:monumental_habit_app/services/app_assets.dart';
import 'package:monumental_habit_app/services/app_colors.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:monumental_habit_app/ui/main_screen/habit/habit_page_cubit.dart';
import 'package:monumental_habit_app/ui/main_screen/habit/habit_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/habit/habit_page_state.dart';

import '../../../services/app_language_constants.dart';

class HabitPage extends StatelessWidget {
  const HabitPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HabitPageCubit(
          navigator: HabitPageNavigator(context: context),
        );
      },
      child: const HabitPageChildPage(),
    );
  }
}

class HabitPageChildPage extends StatefulWidget {
  const HabitPageChildPage({super.key});

  @override
  State<HabitPageChildPage> createState() => _HabitPageChildPageState();
}

class _HabitPageChildPageState extends State<HabitPageChildPage> {
  final TextEditingController _habitController = TextEditingController();
  final FocusNode _focusNodeHabit = FocusNode();

  bool _isStatusNotification = false;
  bool _isShowBanner = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitPageCubit, HabitPageState>(
        builder: (context, state) {
      return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.transparent,
        body: Padding(
          padding: EdgeInsets.only(
              top: AppHelpers.getHeightStatusBarDevice(context) + 25,
              left: 20,
              right: 20,),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _uiAppBar(),
                    const SizedBox(
                      height: 20,
                    ),
                    _uiAddHabit()
                  ],
                ),
              ),


              Positioned(
                  bottom: 120,
                  left: 0,
                  right: 0,
                  child:_isShowBanner ? _uiBannerStartHabit(
                      quote: translation(context).text_quote_2, image: AppAssets.imagePasted):const SizedBox()),
            ],
          ),
        ),
      );
    });
  }

  Widget _uiAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
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
                translation(context).text_new_habit,
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

  Widget _uiAddHabit() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        //Text field habit
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: SizedBox(
              height: 55,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: AppColors.light_primary,
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  controller: _habitController,
                  focusNode: _focusNodeHabit,
                  onChanged: (value) {},
                  onSubmitted: (value) {},
                  keyboardType: TextInputType.text,
                  cursorColor: AppColors.rick_text_orange,
                  showCursor: true,
                  style: const TextStyle(
                      color: AppColors.color_text_field,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: AppHelpers.POPPINS_FONT),
                  decoration: InputDecoration(
                    hintText: translation(context).text_hint_habit,
                    hintStyle: const TextStyle(
                        color: AppColors.color_text_field_hint,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppHelpers.POPPINS_FONT),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    border: InputBorder.none,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0)),
                  ),
                ),
              ),
            )),
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 65,
                height: 65,
                child: Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        width: 50,
                        height: 55,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: AppColors.light_primary,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                              child: FaIcon(
                            FontAwesomeIcons.bookOpen,
                            size: 25,
                          )),
                        ),
                      ),
                    ),
                    const Positioned(
                        top: 0,
                        right: 0,
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppColors.color_floating_button,
                                shape: BoxShape.circle),
                            child: Center(
                              child: FaIcon(
                                Icons.add_rounded,
                                size: 15,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        //Habit frequency
        SizedBox(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            translation(context).text_habit_frequency,
                            maxLines: 1,
                            style: const TextStyle(
                                color: AppColors.text_purple,
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontFamily: AppHelpers.POPPINS_FONT),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              translation(context).text_habit_custom,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: AppColors.color_text_field,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: AppHelpers.POPPINS_FONT),
                            ),
                            const FaIcon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: AppColors.color_text_field,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //Reminder
        SizedBox(
          width: AppHelpers.getSizeWithDevice(context),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: AppColors.light_primary,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        translation(context).text_reminder,
                        maxLines: 1,
                        style: const TextStyle(
                            color: AppColors.text_purple,
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontFamily: AppHelpers.POPPINS_FONT),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "10:00AM",
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: TextStyle(
                              color: AppColors.color_text_field,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppHelpers.POPPINS_FONT),
                        ),
                         FaIcon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: AppColors.color_text_field,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //Notification
        SizedBox(
          width: AppHelpers.getSizeWithDevice(context),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: AppColors.light_primary,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        translation(context).text_notification,
                        maxLines: 1,
                        style: const TextStyle(
                            color: AppColors.text_purple,
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontFamily: AppHelpers.POPPINS_FONT),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 75,
                    child: FlutterSwitch(
                      width: 65,
                      height: 35,
                      valueFontSize: 15,
                      value: _isStatusNotification,
                      showOnOff: true,
                      activeColor: AppColors.color_shadow_floating_button,
                      inactiveColor: AppColors.purple_shadow,
                      activeTextColor: AppColors.color_button_oragne,
                      inactiveTextColor: AppColors.text_purple,
                      activeText: translation(context).text_on,
                      inactiveText: translation(context).text_off,
                      activeTextFontWeight: FontWeight.normal,
                      inactiveTextFontWeight: FontWeight.normal,
                      toggleColor: _isStatusNotification
                          ? AppColors.color_floating_button
                          : AppColors.text_purple,
                      onToggle: (val) {
                        setState(() {
                          _isStatusNotification = val;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _uiBannerStartHabit({required String quote, required String image}) {
    return SizedBox(
      width: AppHelpers.getSizeWithDevice(context),
      height: 210,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: AppHelpers.getSizeWithDevice(context),
              height: 175,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: AppColors.light_primary,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 40, left: 30, right: 30, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          translation(context).text_title_habit_banner,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: const TextStyle(
                              color: AppColors.text_purple,
                              fontSize: 24,
                              fontFamily: AppHelpers.KLASIK_FONT),
                        ),
                      ),
                      AutoSizeText(
                        quote,
                        textAlign: TextAlign.center,
                        minFontSize: 10,
                        stepGranularity: 1.0,
                        maxLines: 2,
                        style: TextStyle(
                            color: AppColors.text_purple.withAlpha(70),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontFamily: AppHelpers.POPPINS_FONT),
                      ),
                      const SizedBox(height: 15,),
                      Image.asset(AppAssets.icArrowBanner, width: 20, height: 27, fit: BoxFit.cover,)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: 75,
              height: 75,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.light_primary,
                    shape: BoxShape.circle,
                  image:  DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.contain,
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
