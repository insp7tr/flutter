import 'package:dashboard/pages/clients/clients.dart';
import 'package:dashboard/pages/drivers/drivers.dart';
import 'package:dashboard/pages/overview/overview.dart';
import 'package:dashboard/routes/routes.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overViewPageRoute:
      return _getPageRoute(const OverViewPage());

    case driversPageRoute:
      return _getPageRoute(const DriversPage());

    case clientsPageRoute:
      return _getPageRoute(const ClientsPage());

    // case authenticationPageRoute:
    //   return _getPageRoute(const AuthenticationPage());

    default:
      return _getPageRoute(const OverViewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
