import 'package:dashboard/constants/style.dart';
import 'package:dashboard/controllers/menu_controller.dart';
import 'package:dashboard/controllers/navigation_controller.dart';
import 'package:dashboard/layout.dart';
import 'package:dashboard/pages/404/error_page.dart';
import 'package:dashboard/pages/authentication/authentication.dart';
import 'package:dashboard/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        scaffoldBackgroundColor: AppStyles.light,
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: Colors.black,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        primaryColor: Colors.blue,
      ),
      initialRoute: authenticationPageRoute,
      getPages: [
        GetPage(
          name: rootRoute,
          page: () => SiteLayout(),
        ),
        GetPage(
          name: authenticationPageRoute,
          page: () => const AuthenticationPage(),
        ),
      ],
      unknownRoute: GetPage(
        name: "/not-found",
        page: () => const PageNotFound(),
        transition: Transition.fadeIn,
      ),
    );
  }
}
