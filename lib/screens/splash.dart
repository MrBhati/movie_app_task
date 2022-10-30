import 'dart:async';

import 'package:fasai_task/constants/custom_constants.dart';
import 'package:fasai_task/constants/screen_names.dart';
import 'package:fasai_task/utils/my_singelton.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      if (Session.instance.userId != null && Session.instance.userId != "") {
        replacement(context: context, screenName: homeScreen);
      } else {
        replacement(context: context, screenName: loginScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset('assets/images/bg.jpg', fit: BoxFit.cover),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    const Color(0xff191a32).withOpacity(0.60),
                    const Color(0xff191a32).withOpacity(1.0)
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
                child: Text(
              "App Verion V10.3",
              style: TextStyle(color: Colors.white),
            )),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png',
                    height: 60, width: 60, fit: BoxFit.cover),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    replacement(context: context, screenName: loginScreen);
                  },
                  child: const Center(
                      child: Text(
                    "Mononton",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 3,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Align(
                    alignment: Alignment.center,
                    child: Expanded(
                      child: Text(
                        "Watch and find movies that bring your mood back",
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
