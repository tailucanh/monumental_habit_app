import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';
import '../ui/home/home_screen_page.dart';


final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    pageBuilder: (BuildContext context, GoRouterState state) {
      return CustomTransitionPage<void>(
        key: state.pageKey,
        child: const HomeScreenPage(),
        transitionDuration: const Duration(milliseconds: 150),
        transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return FadeTransition(
            opacity:
            CurveTween(curve: Curves.easeIn).animate(animation),
            child: child,
          );
        },
      );
    },

  ),
  /*GoRoute(
    path: '/${AppHelpers.KEY_DETAIL_WEATHER}',
    pageBuilder: (BuildContext context, GoRouterState state) {
      return CustomTransitionPage<void>(
        key: state.pageKey,
        child: ,
        transitionDuration: const Duration(milliseconds: 150),
        transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return FadeTransition(
            opacity:
            CurveTween(curve: Curves.easeIn).animate(animation),
            child: child,
          );
        },
      );
    },

  ),*/
]);
CustomTransitionPage<void> BuildCustomTransitionPage({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    barrierDismissible: true,
    barrierColor: Colors.black38,
    opaque: false,
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}


