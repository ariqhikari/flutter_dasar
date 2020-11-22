import 'package:flutter/material.dart';
import 'package:division/division.dart';

abstract class CustomStyles {
  static ParentStyle buttonStyle = ParentStyle(angleFormat: AngleFormat.degree)
    ..background.color(Colors.lightBlue[300])
    ..borderRadius(all: 60)
    ..border(all: 3, color: Colors.lightBlue[900])
    ..elevation(5)
    ..padding(left: 20, right: 20, top: 15, bottom: 15)
    ..rotate(-5)
    ..ripple(true, splashColor: Colors.yellow);

  static TxtStyle txtStyle = TxtStyle()
    ..fontSize(30)
    ..fontFamily("Montserrat")
    ..bold()
    ..textColor(Colors.white);
}
