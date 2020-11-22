import 'package:flutter/material.dart';
import 'package:division/division.dart';
import 'package:my_first_flutter/styles/custom_styles.dart';

class CustomButton extends StatefulWidget {
  final ParentStyle customButton;

  CustomButton(this.customButton);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isTapDown = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Container(
        child: Txt("division", style: CustomStyles.txtStyle),
      ),
      style: widget.customButton
        ..clone()
        ..scale((isTapDown) ? 1.1 : 1)
        ..elevation((isTapDown) ? 0 : 5),
      gesture: Gestures()
        ..onTapDown((details) {
          setState(() {
            isTapDown = true;
          });
        })
        ..onTapUp((details) {
          setState(() {
            isTapDown = false;
          });
        })
        ..onTapCancel(() {
          setState(() {
            isTapDown = false;
          });
        }),
    );
  }
}
