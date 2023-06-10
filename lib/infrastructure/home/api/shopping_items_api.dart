import 'package:dio/dio.dart';
import 'package:nano_health/infrastructure/home/model/shopping_item.dart';

import '../../apiUtil/urls.dart';

class GetShoppingItemApi {
  GetShoppingItemApi({required this.dio});

  final Dio dio;

  getAllItems() async {
    Response response = await dio.get(
      Urls.shoppingItems,
    );
    return response.data;
  }
}
