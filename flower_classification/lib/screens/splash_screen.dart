import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flower_classification/screens/home.dart';
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
        "Flower Classification",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Color(0xFFE99600),
        ),
      ),
      logo: Image.asset("assets/splash.png"),
      gradientBackground: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0.004,
          1,
        ],
        colors: [
          Color(0xFFA8E063),
          Color(0xFF56AB2F),
        ],
      ),
      loaderColor: const Color(0xFFEEDA28),
      logoWidth: 50,
    );
  }
}
