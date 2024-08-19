import 'dart:async';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
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
        backgroundColor: AppColors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _uiAppBar(onTapProfile: () => context.read<HomePageCubit>().openProfilePage()),
            _uiBoxQuote(
                quote: translation(context).text_quote_1,
                author: translation(context).text_author_quote_1)
          ],
        ),
      );
    });
  }

  Widget _uiAppBar({required GestureTapCallback onTapProfile}) {
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
            onTap: onTapProfile,
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
                        AutoSizeText(
                          quote,
                          textAlign: TextAlign.start,
                          minFontSize: 10,
                          stepGranularity: 1.0,
                          maxLines: 3,
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
      ),
    );
  }
}
