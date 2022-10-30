import 'package:fasai_task/constants/custom_constants.dart';
import 'package:fasai_task/constants/screen_names.dart';
import 'package:fasai_task/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../api_client/auth.dart';

class SignUpScreenProvider extends ChangeNotifier {
  static final signUpScreenProviderNotifier =
      ChangeNotifierProvider((ref) => SignUpScreenProvider());

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController fullNameTextController = TextEditingController();
  TextEditingController conformpasswordTextController = TextEditingController();
  final signUpKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  signUp(BuildContext context) {
    authService
        .createUser(emailTextController.text, passwordTextController.text,
            fullNameTextController.text, context)
        .then((value) {
      if (value) {
        replacement(context: context, screenName: homeScreen);
      } else {
        Util.showCustomSnackbar(context, "Somthing Wrowng");
      }
    });
  }
}
