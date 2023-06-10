import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../infrastructure/catalog_facade_service.dart';
import '../util/global_functions.dart';
import '../util/navigation_service.dart';
import '../view/screens/home/home_screen.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel({
    required this.catalogFacadeService,
  });

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final CatalogFacadeService catalogFacadeService;

  void login({
    required String username,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      final res = await catalogFacadeService.login(
        username: username,
        password: password,
      );
      final loginResponse = res;
      if (loginResponse.isNotEmpty) {
        _isLoading = false;
        notifyListeners();
        Navigator.pushReplacementNamed(
          NavigationService.navigatorKey.currentContext!,
          HomeScreen.routeName,
        );
        return;
      }
    } on DioException catch (e) {
      handleDioError(e);
    } catch (e) {
      showToast(
        message: e.toString(),
        context: NavigationService.navigatorKey.currentState!.context,
      );
    }
    _isLoading = false;
    notifyListeners();
  }
}
