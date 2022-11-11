import 'dart:async';

import 'package:ecommerce_app/app/shared/colors.dart';
import 'package:ecommerce_app/meta/views/auth/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: SignupView(), type: PageTransitionType.leftToRight)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Emerce",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
