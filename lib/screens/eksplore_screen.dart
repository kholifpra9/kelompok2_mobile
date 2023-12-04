import 'package:flutter/material.dart';
import 'package:projek_wisata/screens/short_screen.dart';
import 'package:projek_wisata/widgets/button_nav_bar.dart';

class EkspolerScreen extends StatelessWidget {
  const EkspolerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const ButtonNavBar(selectedMenu: MenuState.eksplore),
      body: new Container(
        child: new SingleChildScrollView(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                Row(
                  children: [
                    const Text(
                      "MAU CARI APA NIH?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SearchBar(
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                  ),
                  leading: const Icon(
                    Icons.search,
                    color: Colors.black45,
                  ),
                  hintText: 'Cari apa di Cianjur?',
                  hintStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.grey)),
                  // other arguments
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                new Container(
                  child: new GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShortsScreen())),
                    child: Image.asset('images/splash_1.png'),
                  ),
                  alignment: Alignment.center,
                  width: 200.0,
                  height: 200.0,
                ),
                new Container(
                  child: new GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShortsScreen())),
                    child: Image.asset('images/splash_2.png'),
                  ),
                  alignment: Alignment.center,
                  width: 200.0,
                  height: 200.0,
                ),
                new Container(
                  child: new GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShortsScreen())),
                    child: Image.asset('images/splash_3.png'),
                  ),
                  alignment: Alignment.center,
                  width: 200.0,
                  height: 200.0,
                ),
              ]),
        ),
      ),
    );
  }
}
