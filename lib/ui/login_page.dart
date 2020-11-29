import 'package:flutter/material.dart';
import 'package:my_first_flutter/services/auth_services.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 400,
              height: 100,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email..",
                ),
              ),
            ),
            Container(
              width: 400,
              height: 100,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password..",
                ),
              ),
            ),
            RaisedButton(
              child: Text("Sign In Anonymous"),
              onPressed: () async {
                await AuthServices.signInAnonymous();
              },
            ),
            RaisedButton(
              child: Text("Sign In"),
              onPressed: () async {
                await AuthServices.signIn(
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
            ),
            RaisedButton(
              child: Text("Sign Up"),
              onPressed: () async {
                await AuthServices.signUp(
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
