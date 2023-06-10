import 'api/shopping_items_api.dart';
import 'home_interface.dart';

class HomeRepository implements HomeInterface {
  final GetShoppingItemApi getShoppingItemApi;
  HomeRepository({required this.getShoppingItemApi});

  @override
  getAllItems() async {
    final response = await getShoppingItemApi.getAllItems();
    return response;
  }
}
