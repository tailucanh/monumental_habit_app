import 'dart:async';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:monumental_habit_app/models/progress_time_profile.dart';
import 'package:monumental_habit_app/services/app_assets.dart';
import 'package:monumental_habit_app/services/app_colors.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:monumental_habit_app/services/app_language_constants.dart';
import 'package:monumental_habit_app/ui/main_screen/profile/profile_page_cubit.dart';
import 'package:monumental_habit_app/ui/main_screen/profile/profile_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/profile/profile_page_state.dart';
import 'package:monumental_habit_app/ui/main_screen/profile/widgets/item_profile_setting.dart';
import 'package:monumental_habit_app/ui/main_screen/profile/widgets/item_progress_task.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ProfilePageCubit(
          navigator: ProfilePageNavigator(context: context),
        );
      },
      child: const ProfilePageChildPage(),
    );
  }
}

class ProfilePageChildPage extends StatefulWidget {
  const ProfilePageChildPage({super.key});

  @override
  State<ProfilePageChildPage> createState() => _ProfilePageChildPageState();
}

class _ProfilePageChildPageState extends State<ProfilePageChildPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageCubit, ProfilePageState>(
        builder: (context, state) {
      return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.gradient_home,
        body: Padding(
          padding: EdgeInsets.only(
              top: AppHelpers.getHeightStatusBarDevice(context) + 25,
              left: 15,
              right: 15,
              bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _uiAppBar(
                  onTapBack: () =>
                      context.read<ProfilePageCubit>().onBackMainScreen(),
                  onTapEdit: () {}),
              const SizedBox(
                height: 25,
              ),
              _uiProfileOverview(
                  name: "Marilyn Aminoff",
                  email: "Lucanhtai1504@gmail.com",
                  image: AppAssets.imagePasted,
                  totalTime: 18,
                  totalTask: 12,
                  listData: context.read<ProfilePageCubit>().dataDemo()
              ),
              const SizedBox(
                height: 10,
              ),
              ItemProfileSetting(
                title: translation(context).text_profile_billing,
                content: "",
                icon: Icons.credit_card_outlined,
                onPressed: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              ItemProfileSetting(
                title: translation(context).text_profile_longest_streak,
                content: "20 ${translation(context).text_profile_longest_days}",
                icon: Icons.credit_card_outlined,
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _uiAppBar(
      {required GestureTapCallback onTapBack,
      required GestureTapCallback onTapEdit}) {
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                translation(context).text_profile,
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
        InkWell(
          onTap: onTapEdit,
          borderRadius: BorderRadius.circular(80),
          child: const SizedBox(
            height: 44,
            width: 44,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.purple_shadow),
              child: Center(
                child: FaIcon(
                  Icons.mode_edit_outline_outlined,
                  size: 25,
                  color: AppColors.text_purple,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _uiProfileOverview(
      {required String name, required String email, required String image,
        required int totalTime, required int totalTask, required List<ProgressTimeProfile> listData}) {
    return SizedBox(
      width: AppHelpers.getSizeWithDevice(context),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.light_primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 25, left: 15, right: 15, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: AppColors.light_primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.light_secondary, width: 1),
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.contain,
                          )),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            name.toUpperCase(),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            style: const TextStyle(
                                color: AppColors.text_purple,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppHelpers.POPPINS_FONT),
                          ),
                        ),
                        AppHelpers.isStringNotEmpty(email)
                            ? FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  email,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color:
                                          AppColors.text_purple.withAlpha(50),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: AppHelpers.POPPINS_FONT),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      height: 33,
                      width: 90,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: AppColors.light_primary,
                            border: Border.all(
                                color: Colors.grey.shade400, width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  translation(context)
                                      .text_profile_time_filter_week,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  minFontSize: 8,
                                  maxFontSize: 10,
                                  style: const TextStyle(
                                      color: AppColors.text_purple,
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: AppHelpers.POPPINS_FONT),
                                ),
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColors.text_purple.withAlpha(50),
                                      spreadRadius: -7,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: const FaIcon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 15,
                                  color: AppColors.text_purple,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              color: AppColors.gradient_home,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(width: 0.5, color: AppColors.gradient_home)
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 10, right: 10 ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    translation(context)
                                        .text_profile_total_work,
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    minFontSize: 8,
                                    maxFontSize: 12,
                                    style: TextStyle(
                                        color: AppColors.text_purple.withAlpha(50),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: AppHelpers.POPPINS_FONT),
                                  ),
                                  AutoSizeText(
                                    totalTime.toString(),
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    minFontSize: 20,
                                    maxFontSize: 24,
                                    style: const TextStyle(
                                        color: AppColors.text_purple,
                                        fontSize: 24,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: AppHelpers.KLASIK_FONT),
                                  ),
                                ],
                              )),
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.color_button_oragne
                                          .withAlpha(20)),
                                  child: const Center(
                                    child: FaIcon(
                                      Icons.access_time_filled_outlined,
                                      color: AppColors.color_button_oragne,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                            border: Border(
                                left: BorderSide(width: 0.5, color: AppColors.gradient_home)
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 10, left: 10 ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        translation(context)
                                            .text_profile_task_completed,
                                        textAlign: TextAlign.left,
                                        maxLines: 1,
                                        minFontSize: 8,
                                        maxFontSize: 12,
                                        style: TextStyle(
                                            color: AppColors.text_purple.withAlpha(50),
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: AppHelpers.POPPINS_FONT),
                                      ),
                                      AutoSizeText(
                                        totalTask.toString(),
                                        textAlign: TextAlign.left,
                                        maxLines: 1,
                                        minFontSize: 20,
                                        maxFontSize: 24,
                                        style: const TextStyle(
                                            color: AppColors.text_purple,
                                            fontSize: 24,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: AppHelpers.KLASIK_FONT),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.color_blur_button
                                          .withAlpha(20)),
                                  child: const Center(
                                    child: FaIcon(
                                      Icons.flag_rounded,
                                      color: AppColors.color_blur_button,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            const Divider(
              color: AppColors.gradient_home,
              height: 1,
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height: 110,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: ListView.builder(
                          key:const Key(AppHelpers.KEY_LIST_HABIT_FREQUENCY),
                          shrinkWrap: true,
                          itemCount: listData.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return ItemProgressTask(
                              data: listData[index],
                            );
                          },
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
