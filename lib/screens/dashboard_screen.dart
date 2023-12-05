import 'package:flutter/material.dart';
import 'package:projek_wisata/models/tourism_place.dart';
import 'package:projek_wisata/screens/detail_screen.dart';
import 'package:projek_wisata/widgets/button_nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ButtonNavBar(selectedMenu: MenuState.home),
      body: SingleChildScrollView(
        child: new Column(
          children: [
            //Atas
            new Stack(
              children: [
                new Container(
                  color: Colors.amber[600],
                  width: 380,
                  height: 250,
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
            //Icon tengah
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
            //bodydestinasiterbaik
            new Container(
              width: 380,
              height: 50,
              color: Color(0xFFFAB43F),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                "Destinasi Terbaik",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            new Row(
              children: <Widget>[
                Expanded(
                    child: SizedBox(
                  height: 900.0,
                  child: new ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final TourismPlace place = tourismPlaceList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(place: place);
                          }));
                        },
                        child: Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Image.asset(place.imageAsset),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        place.name,
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(place.location),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: tourismPlaceList.length,
                  ),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
