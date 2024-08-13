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
import 'package:monumental_habit_app/ui/main_screen/course/course_page.dart';
import 'package:monumental_habit_app/ui/main_screen/home/home_page.dart';
import 'package:monumental_habit_app/ui/main_screen/main_screen_state.dart';
import 'package:monumental_habit_app/ui/main_screen/profile/profile_page.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/setting_page.dart';
import 'main_screen_cubit.dart';
import 'main_screen_navigator.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MainScreenCubit(
          navigator: MainScreenNavigator(context: context),
        );
      },
      child: const MainScreenPageChildPage(),
    );
  }
}

class MainScreenPageChildPage extends StatefulWidget {
  const MainScreenPageChildPage({super.key});

  @override
  State<MainScreenPageChildPage> createState() =>
      _MainScreenPageChildPageState();
}

class _MainScreenPageChildPageState extends State<MainScreenPageChildPage> {
  late MainScreenCubit _cubit;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();
  int _currentIndexPage = 0;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
      return Scaffold(
        extendBody: true,
        floatingActionButton: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(90),
          child: SizedBox(
            width: 64,
            height: 64,
            child: DecoratedBox(
                decoration:const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.color_shadow_floating_button),
                child: Center(
                    child: SizedBox(
                        width: 52,
                        height: 52,
                        child: DecoratedBox(
                          decoration:const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.color_floating_button),
                          child: Center(
                            child: Image.asset(
                              AppAssets.icPlus,
                              width: 18,
                              height: 18,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                    )
                )),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          elevation: 0,
          height: 70,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  currentScreen = const HomePage();
                  _currentIndexPage = 0;
                  context.read<MainScreenCubit>().switchPage(_currentIndexPage);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: (state.selectedIndex == 0) ? 1 : 0.4,
                      child: Image.asset(
                        AppAssets.icHome,
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      "Home",
                      style: TextStyle(color: AppColors.transparent, height: 0),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  currentScreen = const CoursePage();
                  _currentIndexPage = 1;
                  context.read<MainScreenCubit>().switchPage(_currentIndexPage);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: (state.selectedIndex == 1) ? 1 : 0.4,
                      child: Image.asset(
                        AppAssets.icCourses,
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      "Courses",
                      style: TextStyle(color: AppColors.transparent, height: 0),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  currentScreen = const ProfilePage();
                  _currentIndexPage = 2;
                  context.read<MainScreenCubit>().switchPage(_currentIndexPage);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Opacity(
                      opacity: (state.selectedIndex == 2) ? 1 : 0.4,
                      child: Image.asset(
                        AppAssets.icCommunity,
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      "Community",
                      style: TextStyle(color: AppColors.transparent, height: 0),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  currentScreen = const SettingPage();
                  _currentIndexPage = 3;
                  context.read<MainScreenCubit>().switchPage(_currentIndexPage);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: (state.selectedIndex == 3) ? 1 : 0.4,
                      child: Image.asset(
                        AppAssets.icSetting,
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      "Setting",
                      style: TextStyle(color: AppColors.transparent, height: 0),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
      );
    });
  }
}
