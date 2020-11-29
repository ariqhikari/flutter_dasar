import 'package:flutter/material.dart';
import 'package:my_first_flutter/ui/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:my_first_flutter/ui/main_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    auth.User firebaseUser = Provider.of<auth.User>(context);

    return (firebaseUser == null) ? LoginPage() : MainPage(firebaseUser);
  }
}
