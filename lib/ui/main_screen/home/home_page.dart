import 'dart:async';
import 'dart:ui';
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
import 'package:monumental_habit_app/ui/main_screen/home/home_page_cubit.dart';
import 'package:monumental_habit_app/ui/main_screen/home/home_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/home/home_page_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomePageCubit(
          navigator: HomePageNavigator(context: context),
        );
      },
      child: const HomePageChildPage(),
    );
  }
}

class HomePageChildPage extends StatefulWidget {
  const HomePageChildPage({super.key});

  @override
  State<HomePageChildPage> createState() => _HomePageChildPageState();
}

class _HomePageChildPageState extends State<HomePageChildPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(builder: (context, state) {
      return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.gradient_home,
        body: Stack(
          children: [
            // Background
            Positioned(
                top: AppHelpers.getSizeHeightDevice(context) / 2.5,
                right: -40,
                child: Image.asset(
                  AppAssets.imageCloud,
                  width: 167,
                  height: 76,
                  fit: BoxFit.contain,
                )),
            Positioned(
                top: AppHelpers.getSizeHeightDevice(context) / 2.3,
                left: -15,
                child: Image.asset(
                  AppAssets.imageCloud2,
                  width: 117,
                  height: 58,
                  fit: BoxFit.contain,
                )),
            Positioned(
                top: AppHelpers.getSizeHeightDevice(context) / 1.5,
                right: 25,
                child: Image.asset(
                  AppAssets.imageCloud2,
                  width: 68,
                  height: 35,
                  fit: BoxFit.contain,
                )),
            Positioned(
                bottom: 0,
                left: -25,
                right: -15,
                child: Image.asset(
                  AppAssets.imageMountain2,
                  width: AppHelpers.getSizeWithDevice(context) + 70,
                  height: 200,
                  fit: BoxFit.contain,
                )),
            Positioned(
                bottom: 0,
                left: -25,
                right: -15,
                child: Image.asset(
                  AppAssets.imageMountain,
                  width: AppHelpers.getSizeWithDevice(context) + 70,
                  height: 200,
                  fit: BoxFit.contain,
                )),
            Positioned(
                bottom: -30,
                left: 20,
                right: 0,
                child: Image.asset(
                  AppAssets.imageLine,
                  width: AppHelpers.getSizeWithDevice(context),
                  height: 150,
                  fit: BoxFit.contain,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                _uiAppBar(),
                _uiBoxQuote(
                    quote: translation(context).text_quote_1,
                    author: translation(context).text_author_quote_1)
              ],
            )
          ],
        ),
      );
    });
  }

  Widget _uiAppBar() {
    return Padding(
      padding: EdgeInsets.only(
          top: AppHelpers.getHeightStatusBarDevice(context) + 25,
          left: 15,
          right: 15,
          bottom: 30),
      child: Row(
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
                  translation(context).text_home_page,
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
            child: SizedBox(
              width: 44,
              height: 44,
              child: DecoratedBox(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                    child: Image.asset(
                  AppAssets.imageTeepeeSwirly,
                  width: 44,
                  height: 44,
                  fit: BoxFit.contain,
                )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _uiBoxQuote({required String quote, required String author}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
      child: SizedBox(
        width: AppHelpers.getSizeWithDevice(context),
        height: 150,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.light_primary),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
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
                        Text(
                          quote,
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: AppColors.text_purple,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppHelpers.KLASIK_FONT),
                        ),
                        Text(
                          "- $author",
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppColors.text_purple.withAlpha(50),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppHelpers.POPPINS_FONT),
                        )
                      ],
                    )),
                SizedBox(
                  height: 150,
                  width: 160,
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
      ),
    );
  }
}
