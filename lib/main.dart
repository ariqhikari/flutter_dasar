import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_flutter/cubit/counter_cubit.dart';

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
  final CounterCubit counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => counterCubit,
      child: Scaffold(
        appBar: AppBar(title: Text("Cubit State Management")),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Cubit State Management",
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                      ),
                    ),
                    BlocBuilder<CounterCubit, CounterState>(
                      builder: (_, cubitState) => Text(
                        (cubitState is CounterStateFilled)
                            ? "${cubitState.value}"
                            : "-",
                        style: GoogleFonts.poppins(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    RaisedButton(
                      child: Text(
                        "+",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {
                        counterCubit.increment(1);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
