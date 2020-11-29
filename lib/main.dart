import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/services/auth_services.dart';
import 'package:my_first_flutter/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error.toString());
          return Text("Error.");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider.value(
            value: AuthServices.firebaseUserStream,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Wrapper(),
            ),
          );
        }

        return Text("Loading, please wait.");
      },
    );
  }
}
