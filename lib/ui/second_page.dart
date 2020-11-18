import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_flutter/bloc/color_bloc.dart';
import 'package:my_first_flutter/bloc/counter_bloc.dart';
import 'package:my_first_flutter/ui/template/draft_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) => DraftPage(
        backgroundColor: color,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BlocBuilder<CounterBloc, int>(
                builder: (context, number) => GestureDetector(
                  onTap: () {
                    counterBloc.add(number + 1);
                  },
                  child: Text(
                    number.toString(),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.pink,
                    shape: (color == Colors.pink)
                        ? CircleBorder(
                            side: BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                          )
                        : CircleBorder(),
                    onPressed: () {
                      colorBloc.add(ColorEvent.toPink);
                    },
                  ),
                  RaisedButton(
                    color: Colors.amber,
                    shape: (color == Colors.amber)
                        ? CircleBorder(
                            side: BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                          )
                        : CircleBorder(),
                    onPressed: () {
                      colorBloc.add(ColorEvent.toAmber);
                    },
                  ),
                  RaisedButton(
                    color: Colors.purple,
                    shape: (color == Colors.purple)
                        ? CircleBorder(
                            side: BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                          )
                        : CircleBorder(),
                    onPressed: () {
                      colorBloc.add(ColorEvent.toPurple);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
