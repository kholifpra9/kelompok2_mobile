import 'package:flutter/material.dart';
// import 'package:projek_wisata/constants.dart';
import 'package:projek_wisata/screens/login_screen.dart';
import 'package:projek_wisata/size_config.dart';
import 'package:projek_wisata/widgets/default_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Wisata App, Let’s Vacation!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We help people conect with store \naround Indonesia",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to vacation. \nJust connect with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Stack(
      children: [
        new Container(
          alignment: Alignment.center,
          color: Colors.amber[600],
          width: 380,
          height: 800,
          child: Image.asset(
            'images/kotaCianjur.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 20),
        new Container(
          alignment: Alignment.center,
          child: Text(
            'SESUATU\nDI\nCIANJUR',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(top: 250),
          alignment: Alignment.center,
          child: Text(
            'Cari apapun yang ingin\nanda kunjungi dan rasakan\n di Cianjur',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(top: 560, left: 90),
          width: 200.0,
          child: DefaultButton(
            text: "Continue",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }),
              );
            },
          ),
        )
      ],
    ));
  }
}
