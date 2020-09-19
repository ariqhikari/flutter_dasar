import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              BuildCard(Icons.account_box, "Account Box"),
              BuildCard(Icons.adb, "Serangga Android"),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildCard extends StatelessWidget {
  // const BuildCard({
  //   Key key,
  //   IconData iconData,
  //   String text
  // }) : super(key: key);

  final IconData iconData;
  final String text;

  BuildCard(this.iconData, this.text);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Icon(
                          this.iconData,
                          color: Colors.green,
                          size: 50,
                        ),
                      ),
                      Text(this.text),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Icon(
                          this.iconData,
                          color: Colors.green,
                          size: 50,
                        ),
                      ),
                      Text(this.text),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Icon(
                          this.iconData,
                          color: Colors.green,
                          size: 50,
                        ),
                      ),
                      Text(this.text),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
