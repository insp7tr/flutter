import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget desktopScreenLayout;

  const Responsive(
      {super.key,
      required this.mobileScreenLayout,
      required this.desktopScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 768) {
          return mobileScreenLayout;
        } else {
          return desktopScreenLayout;
        }
      },
    );
  }
}
