import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_first_flutter/mobx/counter.dart';

final CounterMobx counter = CounterMobx();

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
      appBar: AppBar(title: Text("MOBX State Management Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (context) => Text(
                counter.value.toString(),
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(Icons.arrow_downward),
                  onPressed: () {
                    counter.decrement();
                  },
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  child: Icon(Icons.arrow_upward),
                  onPressed: () {
                    counter.increment();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
