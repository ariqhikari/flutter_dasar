import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Font Features',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: Scaffold(
        appBar: AppBar(title: Text("Font Features")),
        body: Center(
          child: ListView(children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Contoh 01 (Tanpa apapun)",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Contoh 02 (Small Caps)",
                  style: TextStyle(
                    fontSize: 30,
                    fontFeatures: [FontFeature.enable("smcp")],
                  ),
                ),
                Text(
                  "Contoh 1/2 (Small Caps & Frac)",
                  style: TextStyle(
                    fontSize: 30,
                    fontFeatures: [
                      FontFeature.enable("smcp"),
                      FontFeature.enable("frac"),
                    ],
                  ),
                ),
                Text(
                  "Contoh Montserrat 19 (Tanpa apapun)",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Contoh Montserrat 19 (Old Style)",
                  style: TextStyle(
                    fontSize: 30,
                    fontFeatures: [FontFeature.oldstyleFigures()],
                  ),
                ),
                Text(
                  "Contoh Pacifico (Default)",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Pacifico",
                  ),
                ),
                Text(
                  "Contoh Pacifico (Style set nomor 5)",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Pacifico",
                    fontFeatures: [FontFeature.stylisticSet(5)],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
