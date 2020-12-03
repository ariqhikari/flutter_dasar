import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';

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

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isAvailable = false;
  bool isAuthenticated = false;
  String text = "Please Check Biometric Availability";
  LocalAuthentication localAuthentication = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Biometric Authentication")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 200,
              margin: EdgeInsets.only(bottom: 6),
              child: RaisedButton(
                child: Text(
                  "Check Biometrics",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () async {
                  isAvailable = await localAuthentication.canCheckBiometrics;
                  if (isAvailable) {
                    List<BiometricType> types =
                        await localAuthentication.getAvailableBiometrics();
                    text = "Biometrics Available:";
                    for (var item in types) {
                      text += "\n- $item";
                    }
                  }
                  setState(() {});
                },
              ),
            ),
            Container(
              width: 200,
              child: RaisedButton(
                child: Text(
                  "Authenticate",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: (isAvailable)
                    ? () async {
                        isAuthenticated = await localAuthentication
                            .authenticateWithBiometrics(
                                localizedReason: "Please Authenticate",
                                stickyAuth: true,
                                useErrorDialogs: true);
                        setState(() {});
                      }
                    : null,
              ),
            ),
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (isAuthenticated) ? Colors.green : Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.grey[200],
              child: Center(
                child: Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
