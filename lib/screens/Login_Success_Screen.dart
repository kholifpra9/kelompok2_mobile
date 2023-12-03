import 'package:flutter/material.dart';
import 'package:projek_wisata/screens/dashboard_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class LoginSuccessScreen extends StatefulWidget {
  const LoginSuccessScreen({super.key});

  @override
  State<LoginSuccessScreen> createState() => _LoginSuccessScreenState();
}

class _LoginSuccessScreenState extends State<LoginSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login Sukses',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFAB43F),
            ),
          ),
          Image.asset(
            'images/success.gif',
            width: 300,
          ),
          const Text(
            'Hi Cianjur!',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFAB43F),
            ),
          ),
        ],
      ),
      splashIconSize: 400,
      splashTransition: SplashTransition.fadeTransition,
      duration: 2000,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      nextScreen: const DashboardScreen(),
    );
  }
}
