import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  BuildContext context;

  AppNavigator({required this.context});

  void pop<T extends Object?>([T? result]) {
    GoRouter.of(context).pop(result);
  }

}
