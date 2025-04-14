import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  static const String _username = 'key_bd3acb8a06d7178d81770d15d9c237d9';
  static const String _password = 'secret_b2b3de8585c908e98c7a042bccee371e012150e2fe1752a90d0f5fbf958239b6';

  String get basicAuth => 'Basic ${base64Encode(utf8.encode("$_username:$_password"))}';

  Future<dynamic> get({required String endPoint}) async {
    try {
      final response = await dio.get(
        'http://mo7amy.org/ahmed/wp-json/$endPoint',
        options: Options(
          headers: {
            'Authorization': basicAuth,
            'Accept': 'application/json',
          },
        ),
      );
      return response.data;
    } catch (e) {
      print('🔴 API Error: $e');
      rethrow;
    }
  }
}
