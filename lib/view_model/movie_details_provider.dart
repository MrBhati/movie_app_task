import 'dart:convert';

import 'package:fasai_task/api_client/api_client.dart';
import 'package:fasai_task/constants/custom_constants.dart';
import 'package:fasai_task/model/movie_detail_model.dart';
import 'package:fasai_task/utils/my_singelton.dart';
import 'package:fasai_task/utils/util.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/api_constants.dart';

class MovieDetailsScreenProvider extends ChangeNotifier {
  static final movieDetailsScreenProviderNotifier =
      ChangeNotifierProvider((ref) => MovieDetailsScreenProvider());
  TextEditingController playlistNameController = TextEditingController();
  final _apiClient = ApiClient();
  MovieDetailsModel? movieDetailsModel;
  final wachlistKeyKey = GlobalKey<FormState>();
  bool ispublic = true;
  Map<String, dynamic> oldWachlist = {};
  String userNamr = "";

  getUserName(BuildContext context) async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('user/${Session.instance.userId}').get();
    if (snapshot.exists) {
      Map<String, dynamic> userData = json.decode(json.encode(snapshot.value));
      userNamr = userData["name"];
    } else {
      Util.showCustomSnackbar(context, "No data available");
    }
  }

  getMovieDetail(BuildContext context, String id) async {
    getUserName(context);

    _apiClient.getData(url: "$baseUrl?i=$id&apikey=97b2cce").then((value) {
      if (value.statusCode == 200) {
        movieDetailsModel = MovieDetailsModel.fromJson(value.data);
      }
      notifyListeners();
    }).catchError((onError) {
      printStatement(
          data: "error in Get Movie Details api ${onError.response.data}");
      printStatement(data: "error in Get Movie Details $onError");
      return;
    });
  }

  createWatchListInFirebase(BuildContext context) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("user_watchlists/${Session.instance.userId}");

    DataSnapshot data = await ref.get();
    printStatement(data: data.value.toString());

    if (data != null && data.value != null) {
      oldWachlist = json.decode(json.encode(data.value));
    }

    if (oldWachlist.isEmpty) {
      oldWachlist = {
        "name": "$userNamr's Wachlist",
        "is_public": true,
        "movi_list": [
          {
            "name": movieDetailsModel!.title,
            "id": movieDetailsModel!.imdbID,
            "img_url": movieDetailsModel!.poster
          },
        ]
      };
    } else {
      oldWachlist["movi_list"].add({
        "name": movieDetailsModel!.title,
        "id": movieDetailsModel!.imdbID,
        "img_url": movieDetailsModel!.poster
      });
    }
    await ref.set(oldWachlist).then((value) {
      Util.showCustomSnackbar(context, "Movie added to My Wachlist");
    });
  }

  updateWachlistVisiblity() async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("user_watchlists/${Session.instance.userId}");

    await ref.update({
      "is_public": false,
    });
  }

  // String idGenerator() {
  //   final now = DateTime.now();
  //   return now.microsecondsSinceEpoch.toString();
  // }

  // void updateCheckbox(bool? value) {
  //   ispublic = value!;
  //   notifyListeners();
  // }
}
