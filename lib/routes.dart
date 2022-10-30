import 'package:fasai_task/constants/screen_names.dart';
import 'package:fasai_task/screens/home.dart';
import 'package:fasai_task/screens/login.dart';
import 'package:fasai_task/screens/movie_details.dart';
import 'package:fasai_task/screens/my_watchlist.dart';
import 'package:fasai_task/screens/sign_up.dart';
import 'package:fasai_task/screens/splash.dart';
import 'package:fasai_task/screens/users_wachlist.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

const int duration = 100;
const int reverseduration = 100;

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case loginScreen:
      return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: duration),
          reverseDuration: const Duration(milliseconds: reverseduration));

    case signUpScreen:
      return PageTransition(
          child: const SignUpScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: duration),
          reverseDuration: const Duration(milliseconds: reverseduration));

    case homeScreen:
      return PageTransition(
          child: const HomeScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: duration),
          reverseDuration: const Duration(milliseconds: reverseduration));

    case movieList:
      return PageTransition(
          child: const MovieDetailScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: duration),
          reverseDuration: const Duration(milliseconds: reverseduration));

    case splashScreen:
      return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: duration),
          reverseDuration: const Duration(milliseconds: reverseduration));

    case userWachlist:
      return PageTransition(
          child: const UsersWachListScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: duration),
          reverseDuration: const Duration(milliseconds: reverseduration));

    case wachlistScreen:
      return PageTransition(
          child: const MyWachListScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: duration),
          reverseDuration: const Duration(milliseconds: reverseduration));

    default:
      return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: duration),
          reverseDuration: const Duration(milliseconds: reverseduration));
  }
}
