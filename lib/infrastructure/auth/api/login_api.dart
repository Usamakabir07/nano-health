import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../apiUtil/urls.dart';

class LoginApi {
  LoginApi({required this.dio});

  final Dio dio;

  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
    String? latitude,
    String? longitude,
  }) async {
    final params = {
      'username': username,
      'password': password,
    };
    Response response = await dio.post(
      Urls.login,
      data: params,
    );
    return response.data;
  }
}
