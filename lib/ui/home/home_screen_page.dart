import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../services/app_assets.dart';
import '../../services/app_colors.dart';
import '../../services/app_helpers.dart';
import '../../services/app_shared_preference.dart';
import 'home_screen_cubit.dart';
import 'home_screen_navigator.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeScreenCubit(
          navigator: HomeScreenNavigator(context: context),
        );
      },
      child: const HomeScreenChildPage(),
    );
  }
}
class HomeScreenChildPage extends StatefulWidget {
  const HomeScreenChildPage({super.key});

  @override
  State<HomeScreenChildPage> createState() => _HomeScreenChildPageState();
}

class _HomeScreenChildPageState extends State<HomeScreenChildPage> {
  double positionedHeight = 350;
  bool _isScroll = false;
  bool _isTabSelected = true;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
        if(!appSharedPreference.isPermissionLocation){
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          double delta = details.primaryDelta!;
          if (delta < 0) {
            setState(() {
              positionedHeight = AppHelpers.getSizeHeightDevice(context) / 1.16;
              _isScroll = true;
            });
          } else {
            setState(() {
              positionedHeight = 350;
              _isScroll = false;
            });
          }
        },
        onVerticalDragEnd: (details){
          if(positionedHeight  >= AppHelpers.getSizeHeightDevice(context) / 1.16){
            context.go("/${AppHelpers.KEY_DETAIL_WEATHER}");
          }
        },
        child: Stack(
          children:[
            SizedBox(
              width: AppHelpers.getSizeWithDevice(context),
              height: AppHelpers.getSizeHeightDevice(context),
              child: Image.asset(AppAssets.imageBackground,
                width: AppHelpers.getSizeWithDevice(context),
                height: AppHelpers.getSizeHeightDevice(context),
                fit: BoxFit.fitHeight
              ),
            ),
            _uiTemperature(),
            _uiBoxWeather(),
            _uiBottomNavigator(),
            AppHelpers.uiLoading(context, _isLoading),
          ]
        ),
      ),
    );
  }

  Widget _uiBottomNavigator(){
    return  Positioned(
        bottom: -2,
        left: 0,
        right: 0,
        child: SizedBox(
          width: AppHelpers.getSizeWithDevice(context),
          height: 100,
          child: Stack(
              alignment: Alignment.bottomCenter,
              children:[
                ClipRect(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                    child: Image.asset(AppAssets.icBottomBar,
                      fit: BoxFit.fitWidth,
                      width: AppHelpers.getSizeWithDevice(context),),
                  ),
                ),
                SizedBox(
                  child: Image.asset(AppAssets.icSubtract,
                    fit: BoxFit.contain,
                    width: AppHelpers.getSizeWithDevice(context)/ 1.2,),
                ),
                InkWell(
                  onTap: (){
                    AppHelpers.popupPermission(context: context, onAllow: () => {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [AppColors.gradient_black, AppColors.gradient_white],
                            ),
                          ),
                        ),
                        Container(
                          width: 58,
                          height: 58,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [AppColors.gradient_white, AppColors.gradient_grey],
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          AppAssets.icPlus,
                          width: 44,
                          fit: BoxFit.contain,
                          colorFilter:const ColorFilter.mode(AppColors.color_plus, BlendMode.srcIn),),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 25,
                    child: InkWell(
                      onTap: () {

                      },
                      child: SvgPicture.asset(
                        AppAssets.icMap,
                        width: 50,
                        fit: BoxFit.contain,
                        colorFilter:const ColorFilter.mode(AppColors.light_primary, BlendMode.srcIn),),
                    ))
              ]
          ),
        ));
  }

  Widget _uiTemperature(){
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: AppHelpers.getSizeWithDevice(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    fit:BoxFit.scaleDown,
                    child: Text("Thanh Hoa",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                          color: AppColors.light_primary,
                          fontSize: 34,
                          fontStyle: FontStyle.normal,
                          fontFamily: AppHelpers.POPPINS_FONT),),
                  ),
                  Text("19°",
                    style: TextStyle(
                        color: AppColors.light_primary,
                        fontSize: 96,
                        height: 1,
                        fontStyle: FontStyle.normal,
                        fontFamily: AppHelpers.POPPINS_FONT),),
                  FittedBox(
                    fit:BoxFit.scaleDown,
                    child: Text("Mostly Clear",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(color: AppColors.light_secondary,
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontFamily: AppHelpers.POPPINS_FONT),),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("H:24°",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(color: AppColors.light_primary,
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontFamily: AppHelpers.POPPINS_FONT),),
                      const SizedBox(width: 5,),
                      Text("L:18°",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(color: AppColors.light_primary,
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontFamily: AppHelpers.POPPINS_FONT),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: AppHelpers.getSizeWithDevice(context),
            child: Image.asset(AppAssets.icHouse,
              width:AppHelpers.getSizeWithDevice(context),),
          )
        ],
      ),
    );
  }

  Widget _uiBoxWeather(){
      return  AnimatedPositioned(
        bottom: 0,
        left: 0,
        right: 0,
        height: positionedHeight,
        curve: Curves.easeInOut,
        duration:  const Duration(milliseconds: 300),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(44),
            topRight: Radius.circular(44),
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.gradient_blue_1, AppColors.gradient_blue_2],
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 8,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: const BoxDecoration(
                      borderRadius:  BorderRadius.all(Radius.circular(10)),
                      color: AppColors.color_black_30
                    ),
                  ),
                  //App bar
                  Container(
                    margin:  const EdgeInsets.only(top: 15),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.light_tertiary, width: 1)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.color_black_30,
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isTabSelected = true;
                              });
                            },
                            child: SizedBox(
                              width: AppHelpers.getSizeWithDevice(context) / 2 - 15,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text("Hourly Forecast",
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: AppColors.light_secondary,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: AppHelpers.POPPINS_FONT),
                                          ),
                                    ),
                                  ),

                                  _isTabSelected ? Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    width: AppHelpers.getSizeWithDevice(context) / 2 - 15,
                                    height: 5,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [AppColors.color_white_0, AppColors.light_primary,AppColors.color_white_0],
                                      ),
                                    ),
                                  ):  SizedBox(
                                    height: 13,
                                    width: AppHelpers.getSizeWithDevice(context) / 2 - 15,
                                  ),
                                ],
                              ),
                            ),

                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isTabSelected = false;
                              });
                            },
                            child: SizedBox(
                              width: AppHelpers.getSizeWithDevice(context) / 2 - 15,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text("Weekly Forecast",
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: TextStyle(color: AppColors.light_secondary,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: AppHelpers.POPPINS_FONT),
                                      ),
                                    ),
                                  ),
                                  !_isTabSelected ?  Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    width: AppHelpers.getSizeWithDevice(context) / 2 - 15,
                                    height: 5,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [AppColors.color_white_0, AppColors.light_primary,AppColors.color_white_0],
                                      ),
                                    ),
                                  ):  SizedBox(
                                    height: 13,
                                    width: AppHelpers.getSizeWithDevice(context) / 2 - 15,
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ],
                      ),
                    ),
                  ),
                  // UI list
                  _isTabSelected ? _uiListWeatherHourly() : _uiListWeatherWeekly(),
                ],
              ),
            ),
          ),
        ),

      );
  }

  Widget _uiListWeatherHourly(){
      return SizedBox(
        height: 170,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: ListView.builder(
                      key: Key(AppHelpers.KEY_LIST_WEATHER_HOURLY),
                      shrinkWrap: true,
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){

                      },

                  )
              ),
            ],
          ),
        ),
      );
  }

  Widget _uiListWeatherWeekly(){
    return SizedBox(
      height: 170,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: ListView.builder(
                  key: Key(AppHelpers.KEY_LIST_WEATHER_HOURLY),
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){

                  },
                )
            ),
          ],
        ),
      ),
    );
  }

}

