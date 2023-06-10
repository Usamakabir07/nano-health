import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:nano_health/infrastructure/home/model/shopping_item.dart';

import '../infrastructure/catalog_facade_service.dart';
import '../util/global_functions.dart';
import '../util/navigation_service.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required this.catalogFacadeService,
  });
  final CatalogFacadeService catalogFacadeService;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _isError = false;

  bool get isError => _isError;
  List<dynamic> _shoppingItems = <dynamic>[];
  List<dynamic> get items => _shoppingItems;

  getAllItems() async {
    _isLoading = true;
    notifyListeners();
    try {
      var res = await catalogFacadeService.getAllItems();
      _shoppingItems = res;
      notifyListeners();
    } on DioException catch (e) {
      _isError = true;
      handleDioError(e);
    } catch (e) {
      _isError = true;
      showToast(
        message: e.toString(),
        context: NavigationService.navigatorKey.currentState!.context,
      );
    }
    _isLoading = false;
    notifyListeners();
  }
}
