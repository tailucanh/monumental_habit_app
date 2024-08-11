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
      ),
    );
  }

}

