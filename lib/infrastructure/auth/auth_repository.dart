import 'package:dio/dio.dart';
import 'package:nano_health/infrastructure/home/api/shopping_items_api.dart';
import 'package:nano_health/infrastructure/home/model/shopping_item.dart';

import 'api/login_api.dart';
import 'auth_interface.dart';

class AuthRepository implements AuthInterface {
  final LoginApi loginApi;
  final GetShoppingItemApi shoppingItemApi;

  AuthRepository({
    required this.loginApi,
    required this.shoppingItemApi,
  });

  @override
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    final response = await loginApi.login(
      username: username,
      password: password,
    );
    return response;
  }
}
