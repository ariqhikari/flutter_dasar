import 'package:flutter/material.dart';
import 'package:division/division.dart';

abstract class Styles {
  static ParentStyle parentStyle = ParentStyle()
    ..width(300)
    ..height(400)
    ..borderRadius(all: 10)
    ..margin(all: 10)
    ..elevation(3)
    ..background.color(Colors.grey[300]);
}
