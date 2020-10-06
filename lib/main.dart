import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<bool> isSelected = [true, false, false];
  ColorFilter colorFilter = ColorFilter.mode(Colors.blue, BlendMode.screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorFiltered(
        colorFilter: colorFilter,
        child: Scaffold(
          appBar: AppBar(title: Text("Flutter 1.9")),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SelectableText(
                  "Ini adalah Selectable Text. Silahkan pilih saya.",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  showCursor: true,
                  cursorWidth: 3,
                  cursorColor: Colors.red,
                ),
                SizedBox(height: 20),
                ToggleButtons(
                  isSelected: isSelected,
                  children: <Widget>[
                    Icon(Icons.access_alarm),
                    Icon(Icons.adb),
                    Icon(Icons.add_comment),
                  ],
                  onPressed: (index) {
                    setState(() {
                      if (index == 0) {
                        colorFilter =
                            ColorFilter.mode(Colors.blue, BlendMode.screen);
                      } else if (index == 1) {
                        colorFilter =
                            ColorFilter.mode(Colors.green, BlendMode.softLight);
                      } else {
                        colorFilter =
                            ColorFilter.mode(Colors.purple, BlendMode.darken);
                      }
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = (i == index) ? true : false;
                      }
                    });
                  },
                  fillColor: Colors.red[50],
                  selectedColor: Colors.red,
                  selectedBorderColor: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
