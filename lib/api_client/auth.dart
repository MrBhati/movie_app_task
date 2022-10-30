import 'package:fasai_task/theme/colors.dart';
import 'package:fasai_task/utils/my_singelton.dart';
import 'package:fasai_task/utils/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AuthService {
  getUserByUID() {
    if (FirebaseAuth.instance.currentUser == null) {
    } else {}
  }

  Future createUser(String email, String password, String fullName,
      BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Session.instance.userId = credential.user!.uid;

      createUserInFirebase(email, fullName);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Util.showCustomSnackbar(context, "The password provided is too weak.",
            bgcolor: AppColors.accentColor, textColor: AppColors.whiteColor);
      } else if (e.code == 'email-already-in-use') {
        Util.showCustomSnackbar(
            context, "The account already exists for that email.",
            bgcolor: AppColors.accentColor, textColor: AppColors.whiteColor);
      }
    } catch (e) {
      return false;
    }
  }

  createUserInFirebase(String email, String fullname) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("user/${Session.instance.userId}");

    await ref.set({"name": fullname, "email": email, "watchlists": []});
  }

  Future signInUser(String email, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Session.instance.userId = credential.user!.uid;
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Util.showCustomSnackbar(context, "No user found for that email.",
            bgcolor: AppColors.accentColor, textColor: AppColors.whiteColor);
      } else if (e.code == 'wrong-password') {
        Util.showCustomSnackbar(
            context, "Wrong password provided for that user.",
            bgcolor: AppColors.accentColor, textColor: AppColors.whiteColor);
      }
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
