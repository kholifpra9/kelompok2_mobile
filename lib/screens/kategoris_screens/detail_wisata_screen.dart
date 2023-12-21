import 'package:flutter/material.dart';
import 'package:projek_wisata/models/data_wisata.dart';
import 'package:projek_wisata/utils/contants.dart';
import 'package:full_screen_image/full_screen_image.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailWisata extends StatelessWidget {
  final DataWisata place;

  const DetailWisata({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                FullScreenWidget(
                    child: Container(
                      width: 380.0,
                      height: 350.0,
                      child: Image.network(
                        place.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    disposeLevel: DisposeLevel.High),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFFFAC13C),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: mainColor,
              width: 50.0,
              margin: const EdgeInsets.only(top: 16.0, left: 20.0, right: 20.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              // margin: const EdgeInsets.symmetric(vertical: 16.0),
              margin: EdgeInsets.only(
                  top: 30.0, left: 20.0, right: 20.0, bottom: 10.0),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Lokasi : ",
                      ),
                      Text(place.location)
                    ],
                  ),
                  SizedBox(height: 15.0),
                  FloatingActionButton.extended(
                    label: Text(
                      'Lihat di Maps',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: mainColor,
                    icon: Icon(
                      // <-- Icon
                      Icons.map_outlined,
                      size: 24.0,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(height: 30.0)
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return FullScreenWidget(
                    child: Container(
                        padding: EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            url,
                            fit: BoxFit.contain,
                          ),
                        )),
                    disposeLevel: DisposeLevel.High,
                  );
                }).toList(),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 16.0, left: 25.0, right: 25.0),
              width: 100,
              child: Text(
                place.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: secondaryColor,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
