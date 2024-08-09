import 'package:go_router/go_router.dart';

import '../../app/app_navigator.dart';
import '../../services/app_helpers.dart';

class HomeScreenNavigator extends AppNavigator {
  HomeScreenNavigator({required super.context});

  void goToDetailWeather() {
    context.go("/${AppHelpers.KEY_DETAIL_WEATHER}");
  }
}
