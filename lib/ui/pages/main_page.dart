import 'package:division/division.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Semantics(
        hidden: true,
        excludeSemantics: true,
        child: Text("Aplikasi Aksesibilitas"),
      )),
      floatingActionButton: FloatingActionButton(
        child: Semantics(
          onTapHint: "menambahkan bilangan dengan satu.",
          child: Icon(Icons.plus_one),
        ),
        onPressed: () {
          setState(() {
            number++;
          });
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Semantics(
              label:
                  "Ini adalah bilangan yang akan ditambahkan. Bilangan saat ini adalah",
              child: Txt(
                number.toString(),
                style: TxtStyle()
                  ..fontSize(60)
                  ..bold(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
