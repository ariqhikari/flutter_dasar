import 'package:flutter/material.dart';
import 'package:my_first_flutter/ui/switch_day_night.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Rive + Flutter"),
      ),
      body: Center(
        child: SwitchDayNight(),
      ),
    );
  }
}
