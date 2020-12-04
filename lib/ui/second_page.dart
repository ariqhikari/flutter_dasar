import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter/ui/third_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Back to Main Page"),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () async {
                String result = await Get.to<String>(ThirdPage());
                print("====> " + result);
              },
              child: Text("Go to Third Page"),
            )
          ],
        ),
      ),
    );
  }
}
