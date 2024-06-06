import 'package:flutter/material.dart';
import 'package:secondsouffleapp/ui/screens/login.dart';

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
        return MaterialPageRoute(builder: (_) => const Text("Map"));
      case products:
        return MaterialPageRoute(builder: (_) => const Text("Products"));
      case account:
        return MaterialPageRoute(builder: (_) => const Text("Account"));
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
