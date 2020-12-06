import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_flutter/bloc/counter_bloc.dart' as bloc;
import 'package:my_first_flutter/cubit/counter_cubit.dart' as cubit;

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => bloc.CounterBloc()),
          BlocProvider(create: (_) => cubit.CounterCubit()),
        ],
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.black,
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bloc State Management",
                    style:
                        GoogleFonts.poppins(fontSize: 25, color: Colors.white),
                  ),
                  BlocBuilder<bloc.CounterBloc, bloc.CounterState>(
                    builder: (_, state) => Text(
                      (state is bloc.InitializedCounter)
                          ? "${state.number}"
                          : "-",
                      style: GoogleFonts.poppins(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      context.read<bloc.CounterBloc>().add(bloc.Increment());
                    },
                    child: Text(
                      "+",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          context.read<bloc.CounterBloc>().undo();
                        },
                        child: Text(
                          "Undo",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton(
                        onPressed: () {
                          context.read<bloc.CounterBloc>().redo();
                        },
                        child: Text(
                          "Redo",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cubit State Management",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                    ),
                  ),
                  BlocBuilder<cubit.CounterCubit, cubit.CounterState>(
                    builder: (_, state) => Text(
                      (state is cubit.InitializedCounter)
                          ? "${state.number}"
                          : "-",
                      style: GoogleFonts.poppins(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      context.read<cubit.CounterCubit>().increment();
                    },
                    child: Text(
                      "+",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          context.read<cubit.CounterCubit>().undo();
                        },
                        child: Text(
                          "Undo",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton(
                        onPressed: () {
                          context.read<cubit.CounterCubit>().redo();
                        },
                        child: Text(
                          "Redo",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
