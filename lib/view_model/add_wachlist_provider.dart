import 'package:fasai_task/model/movie_detail_model.dart';
import 'package:fasai_task/utils/my_singelton.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddWachlistProvider extends ChangeNotifier {
  static final addWatchListProviderNotifier =
      ChangeNotifierProvider((ref) => AddWachlistProvider());
  TextEditingController playlistNameController = TextEditingController();
  MovieDetailsModel? movieDetailsModel;
  final wachlistKeyKey = GlobalKey<FormState>();
  bool ispublic = true;

  createWatchListInFirebase() async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("user_watchlists/${Session.instance.userId}");

    await ref.set([
      {
        "watchlist_id":
            "${Session.instance.userId}${playlistNameController.text.toString()}",
        "name": playlistNameController.text.toString().trim(),
        "is_public": false,
        "list": [
          {
            "name": movieDetailsModel!.title,
            "id": movieDetailsModel!.imdbID,
            "img_url": movieDetailsModel!.poster
          },
        ]
      },
    ]);
  }

  void updateCheckbox(bool? value) {
    ispublic = value!;
    notifyListeners();
  }
}
