import 'package:flutter/material.dart';

import 'view/screens/home/home_screen.dart';
import 'view/screens/login/login_screen.dart';
import 'view/screens/shoppingItemDetail/shopping_item_detail.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    final Widget view;
    switch (settings.name) {
      case LoginScreen.routeName:
        view = const LoginScreen();
        break;
      case ShoppingItemDetail.routeName:
        view = const ShoppingItemDetail();
        break;
      case HomeScreen.routeName:
        view = const HomeScreen();
        break;
      default:
        view = const HomeScreen();
    }
    return MaterialPageRoute(
      builder: (_) => view,
      settings: settings,
    );
  }
}
