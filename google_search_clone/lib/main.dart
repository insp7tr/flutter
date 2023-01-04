import 'package:flutter/material.dart';
import 'package:google_search_clone/colors.dart';
import 'package:google_search_clone/responsive/desktop_layout.dart';
import 'package:google_search_clone/responsive/mobile_layout.dart';
import 'package:google_search_clone/responsive/responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Search Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const Responsive(
        mobileScreenLayout: MobileLayout(),
        desktopScreenLayout: DesktopLayout(),
      ),

      // const SearchScreen(),
    );
  }
}
