import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_flutter/bloc/user_bloc.dart';
import 'package:my_first_flutter/ui/widgets/user_card.dart';
import 'package:my_first_flutter/model/user.dart';

class MainPage extends StatelessWidget {
  final Random random = Random();
  int beforeId;
  int nowId;

  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Demo MVVM"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            color: Colors.blueGrey,
            child: Text(
              "Pick Random User",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              this.nowId = random.nextInt(10) + 1;

              while (this.beforeId == this.nowId) {
                this.nowId = random.nextInt(10) + 1;
              }

              this.beforeId = this.nowId;
              bloc.add(this.beforeId);
            },
          ),
          BlocBuilder<UserBloc, User>(
            builder: (context, user) =>
                (user is UninitializedUser) ? Container() : UserCard(user),
          ),
        ],
      ),
    );
  }
}
