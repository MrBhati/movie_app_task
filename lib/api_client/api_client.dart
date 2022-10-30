import 'package:dio/dio.dart';

class ApiClient {
  Future<Map<String, String>> getHeader() async {
    Map<String, String> map = {};

    map['Accept'] = "application/json";
    map['Content_Type'] = "application/json";
    return map;
  }

  Future<Response> getData({required String url}) async {
    try {
      final response = await Dio().get(url);
      return response;
    } on DioError {
      rethrow;
    }
  }
}
