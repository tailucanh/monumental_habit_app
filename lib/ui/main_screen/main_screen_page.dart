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
import 'package:monumental_habit_app/ui/main_screen/community/community_page.dart';
import 'package:monumental_habit_app/ui/main_screen/course/course_page.dart';
import 'package:monumental_habit_app/ui/main_screen/habit/habit_page.dart';
import 'package:monumental_habit_app/ui/main_screen/home/home_page.dart';
import 'package:monumental_habit_app/ui/main_screen/main_screen_state.dart';
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
  bool _isClickFloatingButton = false;

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
        backgroundColor: AppColors.gradient_home,
        floatingActionButton: InkWell(
          onTap: () {
            setState(() {
              _isClickFloatingButton = true;
            });
            currentScreen = const HabitPage();
            _currentIndexPage = 2;
            context.read<MainScreenCubit>().switchPage(_currentIndexPage);
          },
          borderRadius: BorderRadius.circular(90),
          child: SizedBox(
            width: 64,
            height: 64,
            child: DecoratedBox(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.color_shadow_floating_button),
                child: Center(
                    child: SizedBox(
                        width: 52,
                        height: 52,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
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
                        )))),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          height: 70,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _uiItemBottomAppBar(
                  icon: AppAssets.icHome,
                  itemIndex: 0,
                  currentIndex: state.selectedIndex,
                  title: "Home",
                  callBackTap: () {
                    currentScreen = const HomePage();
                    _currentIndexPage = 0;
                    context
                        .read<MainScreenCubit>()
                        .switchPage(_currentIndexPage);
                  }),
              _uiItemBottomAppBar(
                  icon: AppAssets.icCourses,
                  itemIndex: 1,
                  currentIndex: state.selectedIndex,
                  title: "Courses",
                  callBackTap: () {
                    currentScreen = const CoursePage();
                    _currentIndexPage = 1;
                    context
                        .read<MainScreenCubit>()
                        .switchPage(_currentIndexPage);
                  }),
              _uiItemBottomAppBar(
                  icon: AppAssets.icCommunity,
                  itemIndex: 3,
                  currentIndex: state.selectedIndex,
                  title: "Community",
                  callBackTap: () {
                    currentScreen = const CommunityPage();
                    _currentIndexPage = 3;
                    context
                        .read<MainScreenCubit>()
                        .switchPage(_currentIndexPage);
                  }),
              _uiItemBottomAppBar(
                  icon: AppAssets.icSetting,
                  itemIndex: 4,
                  currentIndex: state.selectedIndex,
                  title: "Setting",
                  callBackTap: () {
                    currentScreen = const SettingPage();
                    _currentIndexPage = 4;
                    context
                        .read<MainScreenCubit>()
                        .switchPage(_currentIndexPage);
                  }),
            ],
          ),
        ),
        body: Stack(
          children: [
            // Background
            (state.selectedIndex == 0 || state.selectedIndex == 1 || state.selectedIndex == 2) ? Stack(
              children: [
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
                    bottom: -12,
                    left: -25,
                    right: -15,
                    child: Image.asset(
                      AppAssets.imageMountain2,
                      width: AppHelpers.getSizeWithDevice(context) + 70,
                      height: 200,
                      fit: BoxFit.contain,
                    )),
                Positioned(
                    bottom: -12,
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

              ],
            ) : const SizedBox(),

            PageStorage(
              bucket: bucket,
              child: currentScreen,
            ),
          ],
        ),
      );
    });
  }

  Widget _uiItemBottomAppBar(
      {required String icon,
      required int itemIndex,
      required int currentIndex,
      required String title,
      required VoidCallback callBackTap}) {

    CrossAxisAlignment alignment;
    switch(itemIndex){
      case 0:
      case 4:
        alignment = CrossAxisAlignment.center;
        break;
      case 1:
        alignment = CrossAxisAlignment.start;
        break;
      case 3:
        alignment = CrossAxisAlignment.end;
        break;
      default:
        alignment = CrossAxisAlignment.center;
    }
    return GestureDetector(
      onTap: (){
        setState(() {
          _isClickFloatingButton = false;
        });
        callBackTap();
      },
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Opacity(
            opacity: (_isClickFloatingButton && itemIndex == 0) ? 1 : (currentIndex == itemIndex) ? 1 : 0.4,
            child: Image.asset(
              icon,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            style: const TextStyle(color: AppColors.transparent, height: 0),
          )
        ],
      ),
    );
  }
}
