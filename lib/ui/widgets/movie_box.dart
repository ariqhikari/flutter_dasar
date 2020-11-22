import 'package:flutter/material.dart';
import 'package:division/division.dart';
import 'package:my_first_flutter/ui/styles/styles.dart';

class MovieBox extends StatelessWidget {
  final String url;

  MovieBox(this.url);

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: Styles.parentStyle
        ..clone()
        ..background.image(url: url, fit: BoxFit.cover),
    );
  }
}
