import 'package:catvsdog/screens/home.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      durationInSeconds: 2,
      navigator: const HomeScreen(),
      title: const Text(
        "Dog and Cat",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Color(0xFFE99600),
        ),
      ),
      logo: Image.asset("assets/splash.png"),
      backgroundColor: Colors.black,
      loaderColor: const Color(0xFFEEDA28),
    );
  }
}
