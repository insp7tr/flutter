import 'package:dashboard/helpers/responsive.dart';
import 'package:dashboard/widgets/large_screen.dart';
import 'package:dashboard/widgets/side_menu.dart';
import 'package:dashboard/widgets/small_screen.dart';
import 'package:dashboard/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({super.key});

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldkey),
      drawer: const Drawer(
        child: SideMenu(),
      ),
      body: const ResponsiveWidget(
        customScreen: LargeScreen(),
        largeScreen: LargeScreen(),
        mediumScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
