import 'package:flutter/material.dart';
import 'dart:math';

class ColorfulButton extends StatefulWidget {
  Color mainColor, secondColor;
  IconData iconData;

  ColorfulButton(this.mainColor, this.secondColor, this.iconData);

  @override
  _ColorfulButtonState createState() =>
      _ColorfulButtonState(this.mainColor, this.secondColor, this.iconData);
}

class _ColorfulButtonState extends State<ColorfulButton> {
  bool isPressed = false;
  Color mainColor, secondColor;
  IconData iconData;

  _ColorfulButtonState(this.mainColor, this.secondColor, this.iconData);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 4,
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            isPressed = !isPressed;
          });
        },
        onTapUp: (details) {
          setState(() {
            isPressed = !isPressed;
          });
        },
        onTapCancel: () {
          setState(() {
            isPressed = !isPressed;
          });
        },
        child: Material(
          elevation: (isPressed) ? 5 : 10,
          shadowColor: (isPressed) ? secondColor : mainColor,
          borderRadius: BorderRadius.circular(15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: <Widget>[
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    color: (isPressed) ? secondColor : mainColor,
                    child: Transform.rotate(
                      angle: -pi / 4,
                      child: Icon(
                        iconData,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(60, 60),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Material(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(-60, 60),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Material(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(-60, -60),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Material(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(60, -60),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Material(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
