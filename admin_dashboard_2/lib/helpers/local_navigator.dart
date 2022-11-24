import 'package:dashboard/constants/controllers.dart';
import 'package:dashboard/routes/router.dart';
import 'package:dashboard/routes/routes.dart';
import 'package:flutter/material.dart';

Navigator localNavigator() => Navigator(
      key: Controllers.navigationController.navigationKey,
      initialRoute: overViewPageRoute,
      onGenerateRoute: generateRoute,
    );
