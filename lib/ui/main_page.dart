import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:my_first_flutter/services/auth_services.dart';

class MainPage extends StatelessWidget {
  final auth.User user;

  MainPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(user.uid),
            RaisedButton(
              child: Text("Sign Out"),
              onPressed: () async {
                await AuthServices.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
