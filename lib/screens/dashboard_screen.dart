import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projek_wisata/screens/main_screen.dart';
import 'package:projek_wisata/utils/contants.dart';
import 'package:projek_wisata/widgets/button_nav_bar.dart';
import 'package:projek_wisata/widgets/category_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const ButtonNavBar(selectedMenu: MenuState.home),
      body: SingleChildScrollView(
        child: new Column(
          children: [
            new Stack(
              children: [
                new Container(
                  color: Colors.amber[600],
                  width: 380,
                  height: 300,
                  child: Image.asset(
                    'images/kotaCianjur.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                new Container(
                  margin: EdgeInsets.only(top: 30, left: 24),
                  child: Text(
                    'Hi! \nWargi Cianjur!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xFFFAB43F),
                        ),
                        child: Icon(Icons.book_rounded),
                      ),
                      Text('Ngaos'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xFFFAB43F),
                        ),
                        child: Icon(Icons.audiotrack),
                      ),
                      Text('Mamaos'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xFFFAB43F),
                        ),
                        child: Icon(Icons.sports_martial_arts),
                      ),
                      Text('Maen po'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
