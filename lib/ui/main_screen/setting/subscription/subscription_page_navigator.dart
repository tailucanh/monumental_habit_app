import 'package:go_router/go_router.dart';
import 'package:monumental_habit_app/app/app_navigator.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';

class SubscriptionPageNavigator extends AppNavigator {
  SubscriptionPageNavigator({required super.context});

  void onBackPage() {
    context.pop();
  }

}
