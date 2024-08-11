import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:monumental_habit_app/services/app_assets.dart';
import 'package:monumental_habit_app/services/app_colors.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:monumental_habit_app/services/app_language_constants.dart';
import 'package:monumental_habit_app/services/app_shared_preference.dart';
import 'package:monumental_habit_app/ui/onboarding/widgets/slider_page.dart';
import 'package:provider/provider.dart';

import 'on_boarding_cubit.dart';
import 'on_boarding_navigator.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return OnBoardingCubit(
          navigator: OnBoardingNavigator(context: context),
        );
      },
      child: const OnBoardingChildPage(),
    );
  }
}

class OnBoardingChildPage extends StatefulWidget {
  const OnBoardingChildPage({super.key});

  @override
  State<OnBoardingChildPage> createState() => _OnBoardingChildPageState();
}

class _OnBoardingChildPageState extends State<OnBoardingChildPage> {
  late final OnBoardingCubit _cubit;
  late double buttonOffset = 0;
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  double _opacityButton = 0.0;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
    _cubit.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    double heightSlider = AppHelpers.getSizeHeightDevice(context) / 1.15;
    double heightBottomBar =
        AppHelpers.getSizeHeightDevice(context) - heightSlider;

    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, onBoarding) {
      return PopScope(
        canPop: true,
        onPopInvoked: (bool didPop) {
          if (_currentIndex > 0) {
            setState(() {
              _currentIndex--;
            });
            _controller.previousPage();
            context.read<OnBoardingCubit>().onChangeIndex(_currentIndex);
          }
        },
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: heightSlider,
                child: CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: false,
                      height: heightSlider,
                      enlargeCenterPage: false,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        _currentIndex = index;
                        if (_currentIndex ==
                            AppAssets.imagesSlider.length - 1) {
                          setState(() {
                            _opacityButton = 1;
                          });
                        }
                        context
                            .read<OnBoardingCubit>()
                            .onChangeIndex(_currentIndex);
                      }),
                  items:
                      List.generate(AppAssets.imagesSlider.length, (index) {
                    return Builder(
                      builder: (BuildContext context) {
                        return SliderPage(
                          title: AppHelpers.titleSliders(context)[index],
                          image: AppAssets.imagesSlider[index],
                        );
                      },
                    );
                  }),
                ),
              ),
              SizedBox(
                height: heightBottomBar,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (_currentIndex != AppAssets.imagesSlider.length - 1)
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 15),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () => {
                                    //appSharedPreference.isOnboarding = true,
                                    context
                                        .read<OnBoardingCubit>()
                                        .nextPageLogin()
                                  },
                                  child: Text(
                                    translation(context).text_slider_skip,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppColors.text_purple,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: AppHelpers.POPPINS_FONT),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List<Widget>.generate(
                                      AppAssets.imagesSlider.length, (index) {
                                    return Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: onBoarding.index == index
                                                ? AppColors.text_purple
                                                    .withAlpha(20)
                                                : AppColors.transparent,
                                          ),
                                        ),
                                        Container(
                                          width: 13,
                                          height: 13,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: onBoarding.index == index
                                                ? AppColors.text_purple
                                                : AppColors.color_dot_orange,
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                                InkWell(
                                  onTap: () => {
                                    if (_currentIndex ==
                                        AppAssets.imagesSlider.length - 1)
                                      {
                                        setState(() {
                                          _opacityButton = 1;
                                        }),
                                      },
                                    setState(() {
                                      _currentIndex++;
                                    }),
                                    _controller.nextPage(),
                                    context
                                        .read<OnBoardingCubit>()
                                        .onChangeIndex(_currentIndex)
                                  },
                                  child: Text(
                                    translation(context).text_slider_next,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppColors.text_purple,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: AppHelpers.POPPINS_FONT),
                                  ),
                                )
                              ],
                            ),
                          )
                        : AnimatedOpacity(
                          opacity: _opacityButton,
                          duration: const Duration(milliseconds: 200),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 15),
                            child: InkWell(
                              onTap: () {
                                //appSharedPreference.isOnboarding = true,
                                context.read<OnBoardingCubit>().nextPageLogin();
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox(
                                width: AppHelpers.getSizeWithDevice(context),
                                height: 60,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.color_button_oragne,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      translation(context).text_slider_button,
                                      textAlign: TextAlign.center,
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
                          ),
                        ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
