import 'package:go_router/go_router.dart';
import 'package:monumental_habit_app/app/app_navigator.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';

class CommunityPageNavigator extends AppNavigator {
  CommunityPageNavigator({required super.context});

  void openProfilePage() {
    context.goNamed(AppHelpers.KEY_PROFILE_SCREEN);
  }

}
