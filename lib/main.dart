import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final int x = -10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Extension Demo")),
      body: Center(
        child: Text(
          "Bilangan:" & x.negate().toString(),
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

extension NumberExtension<T extends num> on num {
  T negate() => -1 * this;
}

extension StringExtension on String {
  String operator &(String other) => this + " " + other;
}
