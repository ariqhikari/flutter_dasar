import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_flutter/bloc/post_bloc.dart';
import 'package:my_first_flutter/ui/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<PostBloc>(
          create: (context) => PostBloc(PostUninitialized())..add(PostEvent()),
          child: MainPage()),
    );
  }
}
