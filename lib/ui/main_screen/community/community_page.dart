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
import 'package:monumental_habit_app/ui/main_screen/community/community_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/community/community_page_state.dart';

import 'community_page_cubit.dart';


class CommunityPage extends StatelessWidget {
  const CommunityPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CommunityPageCubit(
          navigator: CommunityPageNavigator(context: context),
        );
      },
      child: const CommunityPageChildPage(),
    );
  }
}

class CommunityPageChildPage extends StatefulWidget {
  const CommunityPageChildPage({super.key});

  @override
  State<CommunityPageChildPage> createState() => _CommunityPageChildPageState();
}

class _CommunityPageChildPageState extends State<CommunityPageChildPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityPageCubit, CommunityPageState>(
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
                translation(context).text_community,
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
                    AppAssets.imagePasted,
                    width: 44,
                    height: 44,
                    fit: BoxFit.contain,
                  )),
            ),
          ),
        )
      ],
    );
  }
}
