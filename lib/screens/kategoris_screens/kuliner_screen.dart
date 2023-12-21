import 'package:flutter/material.dart';
import 'package:projek_wisata/models/data_kuliner.dart';
import 'package:projek_wisata/screens/kategoris_screens/detail_kuliner_screen.dart';
import 'package:projek_wisata/utils/contants.dart';

class KulinerScreen extends StatelessWidget {
  const KulinerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuliner Cianjur',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: mainColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final DataKuliner place = DataKulinerList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailKuliner(place: place);
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
        itemCount: DataKulinerList.length,
      ),
    );
  }
}
