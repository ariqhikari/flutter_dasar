import 'package:flutter/material.dart';
import 'package:my_first_flutter/services/auth_services.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Center(
        child: RaisedButton(
          child: Text("Sign In Anonymous"),
          onPressed: () async {
            await AuthServices.signInAnonymous();
          },
        ),
      ),
    );
  }
}
