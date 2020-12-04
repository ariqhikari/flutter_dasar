import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter/ui/main_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Get.off(MainPage());
          },
          child: Text("LOGIN"),
        ),
      ),
    );
  }
}
