//  import 'package:another_flushbar/flushbar.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:fasai_task/constants/screen_names.dart';
import 'package:fasai_task/theme/colors.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

class Util {
  static invalidToken(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, loginScreen, (route) => false);
  }

  static showCustomSnackbar(BuildContext context, String msg,
      {Color? bgcolor, Color? textColor}) {
    Flushbar(
      titleColor: textColor,
      backgroundColor: bgcolor ?? Colors.black,
      message: msg,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.BOTTOM,
    ).show(context);
  }

  static material.Widget loadingView() {
    return material.Center(
      child: material.Theme(
        data: material.ThemeData(),
        child: const material.CircularProgressIndicator(
            color: AppColors.accentColor),
      ),
    );
  }
}
