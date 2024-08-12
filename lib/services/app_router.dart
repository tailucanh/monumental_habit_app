import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';
import 'package:monumental_habit_app/ui/account/login/login_page.dart';
import 'package:monumental_habit_app/ui/account/password/reset_password_page.dart';
import 'package:monumental_habit_app/ui/account/signup/sign_up_page.dart';
import 'package:monumental_habit_app/ui/onboarding/on_boarding_page.dart';
import '../ui/home/home_screen_page.dart';
import '../ui/onboarding/splash_screen.dart';
import 'app_helpers.dart';


final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    pageBuilder: (BuildContext context, GoRouterState state) {
      return CustomTransitionPage<void>(
        key: state.pageKey,
        child: const SplashScreen(),
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
  GoRoute(
    path: '/${AppHelpers.KEY_ONBOADRING_SCREEN}',
    pageBuilder: (BuildContext context, GoRouterState state) {
      return CustomTransitionPage<void>(
        key: state.pageKey,
        child:const OnBoardingPage(),
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return FadeTransition(
            opacity:
            CurveTween(curve: Curves.easeInOut).animate(animation),
            child: child,
          );
        },
      );
    },
  ),
  GoRoute(
    path: '/${AppHelpers.KEY_LOGIN_SCREEN}',
    pageBuilder: (BuildContext context, GoRouterState state) {
      return CustomTransitionPage<void>(
        key: state.pageKey,
        child:const LoginPage(),
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return FadeTransition(
            opacity:
            CurveTween(curve: Curves.easeInOut).animate(animation),
            child: child,
          );
        },
      );
    },
    routes: [
      GoRoute(
          path: AppHelpers.KEY_SIGN_UP_SCREEN,
          name: AppHelpers.KEY_SIGN_UP_SCREEN,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage<void>(
              key: state.pageKey,
              child:const SignUpPage(),
              transitionDuration: const Duration(milliseconds: 200),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return FadeTransition(
                  opacity:
                  CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              },
            );
          },
      ),
      GoRoute(
        path: AppHelpers.KEY_FORGOT_PASSWORD_SCREEN,
        name: AppHelpers.KEY_FORGOT_PASSWORD_SCREEN,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child:const ResetPasswordPage(),
            transitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity:
                CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ]
  ),
  GoRoute(
      path: '/${AppHelpers.KEY_HOME_SCREEN}',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child:const HomeScreenPage(),
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity:
              CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
      routes: [
      ]
  ),
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


