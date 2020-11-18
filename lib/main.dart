import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_flutter/bloc/user_bloc.dart';
import 'package:my_first_flutter/ui/main_page.dart';
import 'package:my_first_flutter/model/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final UninitializedUser user = UninitializedUser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => UserBloc(user),
        child: MainPage(),
      ),
    );
  }
}
