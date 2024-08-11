import 'package:go_router/go_router.dart';
import 'package:monumental_habit_app/app/app_navigator.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';

class LoginNavigator extends AppNavigator {
  LoginNavigator({required super.context});

  void openSignUpPage() {
    context.goNamed(AppHelpers.KEY_SIGN_UP_SCREEN);
  }

  void openForgotPasswordPage() {
    context.goNamed(AppHelpers.KEY_FORGOT_PASSWORD_SCREEN);
  }

}
