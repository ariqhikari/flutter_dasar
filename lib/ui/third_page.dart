import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Get.back(result: "Ini nilai dari page 3");
              },
              child: Text("Back to Second Page"),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                Get.offAllNamed("/main");
              },
              child: Text("Back to Main Page"),
            )
          ],
        ),
      ),
    );
  }
}
