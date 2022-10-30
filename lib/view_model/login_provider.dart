import 'package:fasai_task/constants/custom_constants.dart';
import 'package:fasai_task/constants/screen_names.dart';
import 'package:fasai_task/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api_client/auth.dart';

class LoginScreenProvider extends ChangeNotifier {
  static final loginScreenProviderNotifier =
      ChangeNotifierProvider((ref) => LoginScreenProvider());

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final signInKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  logIn(BuildContext context) {
    authService
        .signInUser(
            emailTextController.text, passwordTextController.text, context)
        .then((value) {
      if (value) {
        replacement(context: context, screenName: homeScreen);
      } else {
        Util.showCustomSnackbar(context, "Somthing Wrowng");
      }
    });
  }
}
