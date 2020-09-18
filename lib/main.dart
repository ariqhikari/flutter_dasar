import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Latihan Animated Container")),
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 50.0 + random.nextInt(101),
              height: 50.0 + random.nextInt(101),
              color: Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                  random.nextInt(256), 1),
            ),
          ),
        ),
      ),
    );
  }
}
