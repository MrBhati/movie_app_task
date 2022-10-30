import 'package:fasai_task/storage_services/shared_pref.dart';

class Session {
  static final Session instance = Session._internal();

  factory Session() {
    return instance;
  }

  String userId = "";

  // UserProfileModel userProfileModel = UserProfileModel();

  SharedPref sharedPref = SharedPref();
  Session._internal();
}
