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
import 'package:monumental_habit_app/ui/main_screen/setting/setting_page_cubit.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/setting_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/setting_page_state.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/widget/item_setting.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SettingPageCubit(
          navigator: SettingPageNavigator(context: context),
        );
      },
      child: const SettingPageChildPage(),
    );
  }
}

class SettingPageChildPage extends StatefulWidget {
  const SettingPageChildPage({super.key});

  @override
  State<SettingPageChildPage> createState() => _SettingPageChildPageState();
}

class _SettingPageChildPageState extends State<SettingPageChildPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingPageCubit, SettingPageState>(
        builder: (context, state) {
      return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.transparent,
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
                _uiAppBar(),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _uiBannerSetting(
                            email: "lucanhtai1504@gmail.com", onTap: () {}),
                        const SizedBox(
                          height: 15,
                        ),
                        _uiGeneral(),
                        const SizedBox(
                          height: 15,
                        ),
                        _uiSupport(),
                        const SizedBox(
                          height: 150,
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

  Widget _uiAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(80),
          child: SizedBox(
            height: 44,
            width: 44,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.purple_shadow),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 18,
                    height: 2.5,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: AppColors.text_purple)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 18,
                    height: 2.5,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: AppColors.text_purple)),
                  ),
                ],
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
                translation(context).text_setting,
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
      {required String email, required GestureTapCallback onTap}) {
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
                    translation(context).text_title_banner_profile,
                    textAlign: TextAlign.start,
                    minFontSize: 10,
                    stepGranularity: 1.0,
                    maxLines: 1,
                    style: const TextStyle(
                        color: AppColors.text_purple,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppHelpers.POPPINS_FONT),
                  ),
                  AutoSizeText(
                    email,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    minFontSize: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppColors.text_purple.withAlpha(50),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontFamily: AppHelpers.POPPINS_FONT),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: onTap,
                    child: SizedBox(
                      width: 120,
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.color_button_oragne),
                        child: Center(
                          child: Text(
                            translation(context).text_button_banner_profile,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: const TextStyle(
                                color: AppColors.text_purple,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontFamily: AppHelpers.POPPINS_FONT),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
              SizedBox(
                height: 150,
                width: AppHelpers.getSizeWithDevice(context) / 2.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    AppAssets.imagePasted,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _uiGeneral() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translation(context).text_setting_general,
          textAlign: TextAlign.start,
          maxLines: 1,
          style: const TextStyle(
              color: AppColors.text_purple,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: AppHelpers.POPPINS_FONT),
        ),
        const SizedBox(
          height: 15,
        ),
        ItemSetting(
          title: translation(context).text_setting_notification,
          icon: Icons.notifications_active_rounded,
          content: translation(context).text_setting_content_notification,
          onPressed: () {},
        ),
        const SizedBox(
          height: 10,
        ),
        ItemSetting(
          title: translation(context).text_setting_more,
          icon: Icons.more_horiz_rounded,
          content: translation(context).text_setting_content_more,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _uiSupport() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translation(context).text_setting_support,
          textAlign: TextAlign.start,
          maxLines: 1,
          style: const TextStyle(
              color: AppColors.text_purple,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: AppHelpers.POPPINS_FONT),
        ),
        const SizedBox(
          height: 15,
        ),
        ItemSetting(
          title: translation(context).text_setting_contact,
          icon: Icons.phone_enabled_rounded,
          content: "",
          onPressed: () {},
        ),
        const SizedBox(
          height: 10,
        ),
        ItemSetting(
          title: translation(context).text_setting_feedback,
          icon: Icons.message_rounded,
          content: "",
          onPressed: () {},
        ),
        const SizedBox(
          height: 10,
        ),
        ItemSetting(
          title: translation(context).text_setting_privacy,
          icon: Icons.privacy_tip_rounded,
          content: "",
          onPressed: () {},
        ),
        const SizedBox(
          height: 10,
        ),
        ItemSetting(
          title: translation(context).text_setting_about,
          icon: Icons.info_rounded,
          content: "",
          onPressed: () {},
        ),
      ],
    );
  }
}
