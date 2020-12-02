import 'dart:math';
import 'package:flutter/material.dart';

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
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 2 * pi).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Basic Animation")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RotatingContainer(
              doubleAnimation: animation,
            ),
            RotationTransition(
              doubleAnimation: animation,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.purpleAccent,
              ),
            ),
            RotationTransition(
                doubleAnimation: animation,
                child: Text("Animation Transition")),
          ],
        ),
      ),
    );
  }
}

class RotatingContainer extends AnimatedWidget {
  RotatingContainer({Key key, Animation<double> doubleAnimation})
      : super(key: key, listenable: doubleAnimation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable as Animation<double>;

    return Transform.rotate(
      angle: animation.value,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

class RotationTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> doubleAnimation;

  RotationTransition({this.child, this.doubleAnimation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      child: child,
      animation: doubleAnimation,
      builder: (context, child) {
        return Transform.rotate(
          angle: doubleAnimation.value,
          child: child,
        );
      },
    );
  }
}
