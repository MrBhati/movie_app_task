import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff191932);
  static const Color accentColor = Color(0xffe72625);
  static const Color secondaryColor = Color(0xff808080);
  static const Color darkPrimearyColor = Color(0xff101124);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff000000);
  static InputDecoration textInputDecoration(
      {required String hint, IconData? iconUrl}) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xffFFFFFF), width: 1),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xffFFFFFF), width: 1),
      ),
      labelStyle: const TextStyle(color: Color(0xffFFFFFF)),
      hintStyle: TextStyle(color: const Color(0xffFFFFFF).withOpacity(0.5)),
      hintText: hint,
    );
  }

  static InputDecoration searchEditTexDecoration(
      {required String hint, IconData? iconUrl, Function? onTabSuffix}) {
    return InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.whiteColor.withOpacity(0.4), width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.whiteColor.withOpacity(0.4), width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        hintText: hint,
        labelStyle: const TextStyle(
          color: AppColors.whiteColor,
        ),
        hintStyle: TextStyle(
          color: AppColors.whiteColor.withOpacity(0.3),
        ),
        suffix: InkWell(
          onTap: () {
            onTabSuffix!();
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(
              "assets/icons/close.png",
              width: 12,
              height: 12,
              fit: BoxFit.fill,
              color: AppColors.whiteColor.withOpacity(0.7),
            ),
          ),
        ),
        prefixIcon: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset("assets/icons/Search.png",
                width: 20,
                height: 20,
                fit: BoxFit.fill,
                color: AppColors.whiteColor.withOpacity(0.7))));
  }
}
