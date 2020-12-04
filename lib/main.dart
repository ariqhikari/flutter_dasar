import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter/ui/login_page.dart';
import 'package:my_first_flutter/ui/main_page.dart';
import 'package:my_first_flutter/ui/second_page.dart';
import 'package:my_first_flutter/ui/third_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => LoginPage()),
        GetPage(name: "/main", page: () => MainPage()),
        GetPage(
          name: "/second",
          page: () => SecondPage(),
          transition: Transition.zoom,
          transitionDuration: Duration(seconds: 1),
        ),
        GetPage(name: "/third", page: () => ThirdPage()),
      ],
    );
  }
}
