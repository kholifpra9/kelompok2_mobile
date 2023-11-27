import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:projek_wisata/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/logo.png',
            width: 300,
          ),
          const Text(
            'Hi Cianjur',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      ),
      splashIconSize: 400,
      splashTransition: SplashTransition.slideTransition,
      duration: 2000,
      backgroundColor: Color.fromARGB(255, 231, 137, 15),
      nextScreen: const HomeScreen(),
    );
  }
}
