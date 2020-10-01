import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_flutter/bloc/color_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
        create: (context) => ColorBloc(Colors.amber),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {
              bloc.add(ColorEvent.to_amber);
            },
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              bloc.add(ColorEvent.to_lightBlue);
            },
          ),
        ],
      ),
      appBar: AppBar(title: Text("BLoC dengan flutter_bloc")),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            width: 200,
            height: 200,
            color: currentColor,
            duration: Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
