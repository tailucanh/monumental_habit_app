import 'package:go_router/go_router.dart';
import 'package:monumental_habit_app/app/app_navigator.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';

class OnBoardingNavigator extends AppNavigator {
  OnBoardingNavigator({required super.context});

  void nextPageLogin() {
    context.go('/${AppHelpers.KEY_LOGIN_SCREEN}');
  }
}
