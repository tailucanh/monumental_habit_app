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
import 'package:monumental_habit_app/ui/main_screen/course/course_page_cubit.dart';
import 'package:monumental_habit_app/ui/main_screen/course/course_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/course/course_page_state.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CoursePageCubit(
          navigator: CoursePageNavigator(context: context),
        );
      },
      child: const CoursePageChildPage(),
    );
  }
}

class CoursePageChildPage extends StatefulWidget {
  const CoursePageChildPage({super.key});

  @override
  State<CoursePageChildPage> createState() => _CoursePageChildPageState();
}

class _CoursePageChildPageState extends State<CoursePageChildPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursePageCubit, CoursePageState>(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _uiAppBar(),
              const SizedBox(
                height: 20,
              ),
              _uiBannerCourse(),
              const SizedBox(
                height: 10,
              ),
              //Layout filter
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: AutoSizeText(
                        "${translation(context).text_sort_by_course}:",
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: const TextStyle(
                            color: AppColors.text_purple,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: AppHelpers.POPPINS_FONT),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 33,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: AppColors.light_primary,
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 1),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    translation(context).text_sort_popular,
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: AppColors.text_purple,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: AppHelpers.POPPINS_FONT),
                                  ),
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.text_purple.withAlpha(50),
                                        spreadRadius: -5,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: const FaIcon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 20,
                                    color: AppColors.text_purple,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(width: 10,),
                  Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 33,
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
                                    translation(context).text_filter,
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: AppColors.color_text_field,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: AppHelpers.POPPINS_FONT),
                                  ),
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.color_text_field.withAlpha(50),
                                        spreadRadius: -5,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: const FaIcon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 20,
                                    color: AppColors.color_text_field,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              //Ui list
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [],
                ),
              ))
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                translation(context).text_course_page,
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
                  Icons.search_rounded,
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

  Widget _uiBannerCourse() {
    return SizedBox(
      width: AppHelpers.getSizeWithDevice(context),
      height: 145,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
                image: AssetImage(AppAssets.imageBannerCourse),
                fit: BoxFit.fitWidth)),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: AppHelpers.getSizeWithDevice(context) / 2,
                child: AutoSizeText(
                  translation(context).text_title_course_banner,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: const TextStyle(
                      color: AppColors.text_purple,
                      fontSize: 36,
                      height: 0,
                      fontFamily: AppHelpers.KLASIK_FONT),
                ),
              ),
              SizedBox(
                width: AppHelpers.getSizeWithDevice(context) / 1.9,
                child: AutoSizeText(
                  translation(context).text_content_course_banner,
                  textAlign: TextAlign.start,
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
      ),
    );
  }
}
