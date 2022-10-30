import 'dart:convert';

import 'package:fasai_task/constants/custom_constants.dart';
import 'package:fasai_task/model/wachlist_model.dart';
import 'package:fasai_task/utils/my_singelton.dart';
import 'package:fasai_task/utils/util.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyWatchlistProvider extends ChangeNotifier {
  static final myWachlistProviderNotifier =
      ChangeNotifierProvider((ref) => MyWatchlistProvider());

  Map<String, dynamic> oldWachlist = {};
  Wachlist? wachlist;

  getMyWachlist() async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("user_watchlists/${Session.instance.userId}");

    DataSnapshot oldData = await ref.get();
    printStatement(data: oldData.value.toString());

    if (oldData != null && oldData.value != null) {
      oldWachlist = json.decode(json.encode(oldData.value));
      wachlist = Wachlist.fromJson(oldWachlist);
      printStatement(data: wachlist?.toJson().toString() ?? "");
    }

    notifyListeners();
  }

  updateWachlistVisiblity(bool value, BuildContext context) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("user_watchlists/${Session.instance.userId}");

    await ref.update({
      "is_public": value,
    }).then((value) {
      Util.showCustomSnackbar(
          context, "Update wachlist visiblity successfully..");
    });
  }
}
