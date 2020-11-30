import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/services/auth_services.dart';
import 'package:my_first_flutter/services/database_services.dart';
import 'package:my_first_flutter/ui/error_page.dart';
import 'package:my_first_flutter/ui/loading_page.dart';
import 'package:my_first_flutter/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: Firebase.initializeApp(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       print(snapshot.error.toString());
    //       return Text("Error.");
    //     }

    //     if (snapshot.connectionState == ConnectionState.done) {
    //       return StreamProvider.value(
    //         value: AuthServices.firebaseUserStream,
    //         child: MaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           home: Wrapper(),
    //         ),
    //       );
    //     }

    //     return Text("Loading, please wait.");
    //   },
    // );
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error.toString());
          return ErrorPage();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(title: Text("Firsestore Demo")),
              body: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("Add Data"),
                        onPressed: () {
                          DatabaseServices.createOrUpdateProduct(
                            "1",
                            name: "Masker",
                            price: 1000000,
                          );
                        },
                      ),
                      RaisedButton(
                        child: Text("Edit Data"),
                        onPressed: () {
                          DatabaseServices.createOrUpdateProduct(
                            "1",
                            name: "Masker",
                            price: 2000000,
                          );
                        },
                      ),
                      RaisedButton(
                        child: Text("Get Data"),
                        onPressed: () async {
                          DocumentSnapshot snapshot =
                              await DatabaseServices.getProduct("1");
                          print(snapshot.data()["nama"]);
                          print(snapshot.data()["harga"]);
                        },
                      ),
                      RaisedButton(
                        child: Text("Delete Data"),
                        onPressed: () async {
                          await DatabaseServices.deleteProduct("1");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return LoadingPage();
      },
    );
  }
}
