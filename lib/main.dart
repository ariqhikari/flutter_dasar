import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.srirachaTextTheme(),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color fontColor = const Color(0XFFFFB401);
    TextStyle textStyle = TextStyle(color: fontColor, fontSize: 32);

    return Scaffold(
      backgroundColor: const Color(0XFF1E252D),
      appBar: AppBar(
        backgroundColor: const Color(0XFF282F37),
        title: Text("Google Fonts Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "I'll keep learning Flutter!",
              style: textStyle,
            ),
            Text(
              "O yeah !!",
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
