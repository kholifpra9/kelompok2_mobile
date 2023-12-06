import 'package:flutter/material.dart';
import 'package:projek_wisata/models/data_wisata.dart';
import 'package:projek_wisata/screens/kategoris_screens/detail_wisata_screen.dart';
import 'package:projek_wisata/utils/contants.dart';

class WisataScreen extends StatelessWidget {
  const WisataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Cianjur'),
        backgroundColor: mainColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final DataWisata place = DataWisataList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailWisata(place: place);
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
        itemCount: DataWisataList.length,
      ),
    );
  }
}