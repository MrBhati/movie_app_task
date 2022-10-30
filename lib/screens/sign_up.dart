import 'package:fasai_task/constants/custom_constants.dart';
import 'package:fasai_task/constants/screen_names.dart';
import 'package:fasai_task/custom_widget/main_button.dart';
import 'package:fasai_task/theme/colors.dart';
import 'package:fasai_task/theme/text_styles.dart';
import 'package:fasai_task/view_model/signup_provide.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final watchSignUPProvider =
            ref.watch(SignUpScreenProvider.signUpScreenProviderNotifier);
        return SingleChildScrollView(
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
                Positioned(
                  top: 50,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child: SingleChildScrollView(
                      child: Form(
                        key: watchSignUPProvider.signUpKey,
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
                              height: 40,
                            ),
                            const Text(
                              "Full name",
                              style: TextStryles.textFiledText,
                            ),
                            TextFormField(
                              controller:
                                  watchSignUPProvider.fullNameTextController,
                              style: const TextStyle(
                                color: AppColors.whiteColor,
                              ),
                              decoration: AppColors.textInputDecoration(
                                  hint: "Eg. Surendra Bhati"),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.length < 4) {
                                  return 'Please enter full name its required';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              "Email",
                              style: TextStryles.textFiledText,
                            ),
                            TextFormField(
                              controller:
                                  watchSignUPProvider.emailTextController,
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
                                  watchSignUPProvider.passwordTextController,
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
                                  return 'Please enter Pssword its required';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              "Conform password",
                              style: TextStryles.textFiledText,
                            ),
                            TextFormField(
                              controller: watchSignUPProvider
                                  .conformpasswordTextController,
                              obscureText: true,
                              style: const TextStyle(
                                color: AppColors.whiteColor,
                              ),
                              decoration: AppColors.textInputDecoration(
                                  hint: "***********"),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value !=
                                    watchSignUPProvider
                                        .passwordTextController.text
                                        .trim()) {
                                  return 'Please enter passwod is not mach';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            MainButton(
                              width: double.infinity,
                              onPressed: () {
                                if (watchSignUPProvider.signUpKey.currentState!
                                    .validate()) {
                                  watchSignUPProvider.signUp(context);
                                }
                              },
                              height: 50,
                              borderRadius: BorderRadius.circular(8),
                              child: const Text(
                                'Sign Up',
                                style: TextStryles.mainButtonText,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                replacement(
                                    context: context, screenName: loginScreen);
                              },
                              child: Center(
                                child: RichText(
                                  text: const TextSpan(
                                    text: 'already a user?  ',
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'LogIn',
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
                ),
              ],
            ),
          ),
        );
      }),
    ));
  }
}
