import 'package:flutter/material.dart';
import 'package:to_do_app/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case TabsScreen.routeName:
        return TabsScreen.route();
      case RecycleBin.routeName:
        return RecycleBin.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: "/error"),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
      ),
    );
  }
}
