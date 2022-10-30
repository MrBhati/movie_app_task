import 'package:fasai_task/constants/custom_constants.dart';
import 'package:fasai_task/constants/screen_names.dart';
import 'package:fasai_task/custom_widget/main_button.dart';
import 'package:fasai_task/theme/colors.dart';
import 'package:fasai_task/theme/text_styles.dart';
import 'package:fasai_task/view_model/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final watchLoginProvider =
            ref.watch(LoginScreenProvider.loginScreenProviderNotifier);
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.bottom -
                  MediaQuery.of(context).padding.top,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child:
                        Image.asset('assets/images/bg.jpg', fit: BoxFit.cover),
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
                      style: TextStyle(color: AppColors.whiteColor),
                    )),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(30, 100, 30, 30),
                      child: Form(
                        key: watchLoginProvider.signInKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/logo.png',
                                height: 80, width: 80, fit: BoxFit.cover),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Mononton",
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 3,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text(
                              "Watch and find movies that bring your mood back",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            const Text(
                              "Email",
                              style: TextStryles.textFiledText,
                            ),
                            TextFormField(
                              controller:
                                  watchLoginProvider.emailTextController,
                              style: const TextStyle(
                                color: AppColors.whiteColor,
                              ),
                              decoration: AppColors.textInputDecoration(
                                  hint: "Eg. jack@gmail.com"),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.length < 4) {
                                  return 'Please enter email its required';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              "Password",
                              style: TextStryles.textFiledText,
                            ),
                            TextFormField(
                                controller:
                                    watchLoginProvider.passwordTextController,
                                obscureText: true,
                                style: const TextStyle(
                                  color: AppColors.whiteColor,
                                ),
                                decoration: AppColors.textInputDecoration(
                                    hint: "***********"),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.length < 4) {
                                    return 'Please enter password its required';
                                  } else {
                                    return null;
                                  }
                                }),
                            const SizedBox(
                              height: 30,
                            ),
                            MainButton(
                              width: double.infinity,
                              onPressed: () {
                                if (watchLoginProvider.signInKey.currentState!
                                    .validate()) {
                                  watchLoginProvider.logIn(context);
                                }
                              },
                              height: 50,
                              borderRadius: BorderRadius.circular(8),
                              child: const Text(
                                'SignIn',
                                style: TextStryles.mainButtonText,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                replacement(
                                    context: context, screenName: signUpScreen);
                              },
                              child: Center(
                                child: RichText(
                                  text: const TextSpan(
                                    text: 'need an account?  ',
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: 'SignUP',
                                          style: TextStyle(
                                              color: AppColors.accentColor,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    ));
  }
}
