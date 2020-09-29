import 'package:flutter/material.dart';
import 'package:my_first_flutter/api/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = "No data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("HTTP Request")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(output),
              RaisedButton(
                child: Text("GET"),
                onPressed: () {
                  User.getUsers().then((users) {
                    output = "";
                    for (int i = 0; i < users.length; i++) {
                      output = output + "[ " + users[i].name + " ] ";
                    }
                    setState(() {});
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
