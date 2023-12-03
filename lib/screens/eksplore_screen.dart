import 'package:flutter/material.dart';
import 'package:projek_wisata/widgets/button_nav_bar.dart';

class EkspolerScreen extends StatelessWidget {
  const EkspolerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ButtonNavBar(selectedMenu: MenuState.eksplore),
      body: new Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              new Image.asset(
                'images/splash_1.png',
                fit: BoxFit.fill,
                width: 100.0,
                height: 100.0,
              ),
              new Image.asset(
                'images/splash_2.png',
                fit: BoxFit.fill,
                width: 100.0,
                height: 100.0,
              ),
              new Image.asset(
                'images/splash_3.png',
                fit: BoxFit.contain,
                width: 100.0,
                height: 100.0,
              )
            ]),
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
      ),
    );
  }
}
