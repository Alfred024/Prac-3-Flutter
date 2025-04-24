import 'package:flutter/material.dart';
import 'package:services_management/presentation/screens/screens.dart';

class Routes {
  // static const login = '/login';
  // static const register = '/register';

  // static const splash = '/';
  static const orders = '/orders';
  // static const products = '/products';
  static const products = '/';
  static const updateProduct = '/update_product';
  static const registerProduct = '/register_product';

  static Route routes(RouteSettings settings) {
    MaterialPageRoute buildRoute(Widget widget) {
      return MaterialPageRoute(builder: (_) => widget, settings: settings);
    }

    switch (settings.name) {
      // case splash:
      //   return buildRoute(const SplashScreen());
      case orders:
        return buildRoute(const OrdersScreen());
      case products:
        return buildRoute(const ProductsScreen());
      case updateProduct:
        return buildRoute(const UpdateProductScreen());
      case registerProduct:
        return buildRoute(const RegisterProductScreen());
      default:
        throw Exception('Route does not exists');
    }
  }
}
