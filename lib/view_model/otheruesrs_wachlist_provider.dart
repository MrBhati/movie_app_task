import 'dart:convert';

import 'package:fasai_task/constants/custom_constants.dart';
import 'package:fasai_task/model/wachlist_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsersWatchlistProvider extends ChangeNotifier {
  static final usersWachlistProviderNotifier =
      ChangeNotifierProvider((ref) => UsersWatchlistProvider());

  Map<String, dynamic> oldWachlist = {};
  Wachlist? wachlist;
  List<Wachlist> wachlists = [];

  getUsersWachlist() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("user_watchlists/");

    DataSnapshot oldData = await ref.get();
    printStatement(data: oldData.value.toString());

    if (oldData != null && oldData.value != null) {
      oldWachlist = json.decode(json.encode(oldData.value));
      oldWachlist.forEach(
        (key, value) {
          wachlists.add(Wachlist.fromJson(value));
          printStatement(data: wachlists.length.toString());
        },
      );
    }
    notifyListeners();
  }
}
