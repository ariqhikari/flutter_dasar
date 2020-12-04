import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Get.toNamed(
              "/second?name=Ariq Hikari&from=Indonesia",
              arguments: ["Hello", "World"],
            );
          },
          child: Text("Go to Second Page"),
        ),
      ),
    );
  }
}
