import 'package:flutter/material.dart';
import 'package:projek_wisata/screens/short_screen.dart';
import 'package:projek_wisata/widgets/button_nav_bar.dart';
import 'package:simple_fx/simple_fx.dart';

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Explore Cianjur!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                new Container(
                  width: 300,
                  child: SearchBar(
                    leading: const Icon(
                      Icons.search,
                      color: Colors.black45,
                    ),
                    hintText: 'Cari apa di Cianjur?',
                    hintStyle: MaterialStateProperty.all(
                        const TextStyle(color: Colors.grey)),
                    // other arguments
                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                SizedBox(height: 20),
                new Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: new ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: new GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShortsScreen())),
                          child: SimpleFX(
                            imageSource: Image.asset(
                              'images/wisata1.jpg',
                              fit: BoxFit.cover,
                              width: 300.0,
                              height: 130.0,
                            ),
                            brightness: -20,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "TEMPAT WISATA",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                new Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: new ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: new GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShortsScreen())),
                          child: SimpleFX(
                            imageSource: Image.asset(
                              'images/wisata2.jpg',
                              fit: BoxFit.cover,
                              width: 300.0,
                              height: 130.0,
                            ),
                            brightness: -20,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "KULINER",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                new Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: new ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: new GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShortsScreen())),
                          child: SimpleFX(
                            imageSource: Image.asset(
                              'images/wisata3.jpg',
                              fit: BoxFit.cover,
                              width: 300.0,
                              height: 130.0,
                            ),
                            brightness: -20,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "SPOT HEALING",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
