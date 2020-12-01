import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shimmer Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://lumiere-a.akamaihd.net/v1/images/star-wars-the-rise-of-skywalker-theatrical-poster-1000_ebc74357.jpeg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Shimmer(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.4, 0.5, 0.6],
                    colors: [
                      Color.fromRGBO(224, 224, 224, 0),
                      Color.fromRGBO(224, 224, 224, 0.8),
                      Color.fromRGBO(224, 224, 224, 0),
                    ],
                  ),
                  child: Container(
                    width: 200,
                    height: 300,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Shimmer(
              direction: ShimmerDirection.rtl,
              gradient: LinearGradient(
                stops: [0.45, 0.5, 0.55],
                colors: [
                  Colors.black,
                  Colors.white,
                  Colors.black,
                ],
              ),
              child: Text(
                "Star Wars: The Rise of Skywalker",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
