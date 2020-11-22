import 'package:flutter/material.dart';
import 'package:division/division.dart';
import 'package:my_first_flutter/ui/styles/styles.dart';

class MovieBox extends StatelessWidget {
  final String url;
  final double scale;

  MovieBox(this.url, {this.scale = 1});

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: Styles.parentStyle
        ..clone()
        ..background.image(url: url, fit: BoxFit.cover)
        ..width(300 * scale)
        ..height(400 * scale),
    );
  }
}
