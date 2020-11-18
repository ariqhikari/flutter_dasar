import 'package:flutter/material.dart';

class DraftPage extends StatelessWidget {
  final Color backgroundColor;
  final Widget body;

  DraftPage({this.body, this.backgroundColor = Colors.pink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("Demo MultiBloc in Multipage App"),
      ),
      body: body,
    );
  }
}
