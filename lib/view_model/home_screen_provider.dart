import 'dart:convert';
import 'package:fasai_task/api_client/api_client.dart';
import 'package:fasai_task/constants/api_constants.dart';
import 'package:fasai_task/constants/custom_constants.dart';
import 'package:fasai_task/model/search_model.dart';
import 'package:fasai_task/utils/my_singelton.dart';
import 'package:fasai_task/utils/util.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../api_client/auth.dart';

class HomeScreenProvider extends ChangeNotifier {
  static final homeScreenProviderNotifier =
      ChangeNotifierProvider((ref) => HomeScreenProvider());

  TextEditingController searchTextController = TextEditingController();
  AuthService authService = AuthService();
  final _apiClient = ApiClient();

  String userNamr = "";
  SearchModel? hrsearchModel;
  SearchModel? vrsearchModel;
  SearchModel? searchModel;
  List<Search> hrMovilist = [];
  List<Search> searchMovilist = [];
  List<Search> vrMovilist = [];
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  getUserName(BuildContext context) async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('user/${Session.instance.userId}').get();
    if (snapshot.exists) {
      Map<String, dynamic> userData = json.decode(json.encode(snapshot.value));
      userNamr = userData["name"];
    } else {
      Util.showCustomSnackbar(context, "No data available.");
    }
  }

  getVRMovilist(BuildContext context) async {
    getUserName(context);
    _apiClient.getData(url: "$baseUrl?s=Batman&apikey=$ombdAkey").then((value) {
      printStatement(data: "response ${json.encode(value.data)}");
      if (value.statusCode == 200) {
        vrsearchModel = SearchModel.fromJson(value.data);
        vrMovilist = vrsearchModel!.search!;
        printStatement(data: vrsearchModel.toString());
      }
      notifyListeners();
    }).catchError((onError) {
      printStatement(data: "error in Get Movie api ${onError.response.data}");
      printStatement(data: "error in Get Movie $onError");
      return;
    });
  }

  getSearchMovilist(BuildContext context, String title) async {
    searchMovilist.clear();
    if (title.length < 3) {
      notifyListeners();
      searchMovilist.clear();

      return;
    }

    searchTextController.text = title;

    _apiClient.getData(url: "$baseUrl?s=$title&apikey=$ombdAkey").then((value) {
      if (value.statusCode == 200) {
        searchModel = SearchModel.fromJson(value.data);

        searchMovilist = searchModel!.search!;
        printStatement(data: searchModel.toString());
      }
      notifyListeners();
    }).catchError((onError) {
      printStatement(data: "error in Get Movie api ${onError.response.data}");
      printStatement(data: "error in Get Movie $onError");
      return;
    });
  }

  getHRMovilist(BuildContext context) async {
    _apiClient
        .getData(url: "$baseUrl?s=Avengers&apikey=$ombdAkey")
        .then((value) {
      printStatement(data: json.encode(value.data));
      if (value.statusCode == 200) {
        hrsearchModel = SearchModel.fromJson(value.data);
        hrMovilist = hrsearchModel!.search!;
        printStatement(data: hrsearchModel.toString());
      }
      notifyListeners();
    }).catchError((onError) {
      return;
    });
  }

  bool checkDomaiValication(BuildContext context) {
    bool isSelected = false;

    return isSelected;
  }

  void resetSearch() {
    searchMovilist.clear();
    searchTextController.text = "";
    notifyListeners();
  }
}
