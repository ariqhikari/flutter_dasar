import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lottie Animation Demo",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: LottieBuilder.asset(
                "assets/animations/orang-bawa-kardus.json",
                controller: controller,
              ),
            ),
            Text(
              "Featured Lottie Animation by Bilal Arief",
              style: GoogleFonts.poppins(),
            ),
            RaisedButton(
              child: Text(
                "Play Animation",
                style: GoogleFonts.poppins(),
              ),
              onPressed: () {
                controller.value = 0;
                controller.forward();
              },
            ),
          ],
        ),
      ),
    );
  }
}
