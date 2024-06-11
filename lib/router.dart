import 'package:flutter/material.dart';
import 'package:secondsouffleapp/ui/screens/account.dart';
import 'package:secondsouffleapp/ui/screens/login.dart';
import 'package:secondsouffleapp/ui/screens/map.dart';
import 'package:secondsouffleapp/ui/screens/product.dart';

class Routes {
  static const String login = '/login';
  static const String map = '/map';
  static const String products = '/products';
  static const String account = '/account';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case map:
        return MaterialPageRoute(builder: (_) => const MapPage());
      case products:
        return MaterialPageRoute(builder: (_) => const ProductsPage());
      case account:
        return MaterialPageRoute(builder: (_) => const AccountPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
