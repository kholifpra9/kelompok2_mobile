import 'package:flutter/material.dart';
import 'package:projek_wisata/screens/login_screen.dart';
// import 'package:projek_wisata/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hi Cianjur',
      theme: ThemeData(),
      home: const LoginScreen(),
    );
  }
}
