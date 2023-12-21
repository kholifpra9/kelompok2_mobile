import 'package:flutter/material.dart';
import 'package:projek_wisata/models/data_spot.dart';
import 'package:projek_wisata/screens/kategoris_screens/detail_spot_screen.dart';
import 'package:projek_wisata/utils/contants.dart';

class SpotScreen extends StatelessWidget {
  const SpotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Spot healing Cianjur',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: mainColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final DataSpot place = DataSpotList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailSpot(place: place);
              }));
            },
            child: Card(
              margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      child: Image.network(
                        place.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            place.name,
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
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
        itemCount: DataSpotList.length,
      ),
    );
  }
}
