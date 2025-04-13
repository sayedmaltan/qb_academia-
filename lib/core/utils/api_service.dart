import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  late Dio dio=Dio();
  final String _baseUrl = 'https://timease.up.railway.app/api/';
  static const username = 'key_bd3acb8a06d7178d81770d15d9c237d9';
  static String password = 'secret_b2b3de8585c908e98c7a042bccee371e012150e2fe1752a90d0f5fbf958239b6';
  String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';

  ApiService();

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get(
      _baseUrl + endPoint,
      options: Options(
        headers: {
          'Authorization': basicAuth,
          'Content-Type': 'application/json',
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required body}) async {
    var response = await dio.post(
      _baseUrl + endPoint,
      data: body,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endPoint, required body}) async {
    var response = await dio.put(
      _baseUrl + endPoint,
      data: body,
    );
    return response.data;
  }

  Future<void> delete({required String endPoint}) async {
    await dio.delete(
      _baseUrl + endPoint,
    );
    // return response.data;
  }
}
