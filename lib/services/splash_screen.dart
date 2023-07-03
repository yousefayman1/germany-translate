import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:german/layout/start_screen.dart';

class Splash extends StatefulWidget {
  static const String routname = 'Splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int time_duration = 2000;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/logooo.png',
      // splash image
      nextScreen: StartScreen(),
      //navigation
      backgroundColor: Color.fromARGB(255, 52,73,94),
      splashIconSize: 500,
      //size of splash image
      duration: 1000,
      // time
      animationDuration: Duration(milliseconds: this.time_duration),
    );
  }
}