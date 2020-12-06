import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("URL Launcher Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LaunchButton("Call", () async {
              await call("+6285156567283");
            }),
            LaunchButton("SMS", () async {
              await sendSMS("+6285156567283");
            }),
            LaunchButton("Email", () async {
              await sendEmail("ahidayatbia@gmail.com");
            }),
            LaunchButton("URL", () async {
              await openURL(
                "https://google.com",
                forceWebView: true,
                enableJavascript: true,
              );
            }),
          ],
        ),
      ),
    );
  }
}

class LaunchButton extends StatelessWidget {
  final String text;
  final Function onTap;

  LaunchButton(this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: RaisedButton(
        child: Text(text),
        color: Colors.blue[100],
        onPressed: onTap,
      ),
    );
  }
}

Future<void> call(String phoneNumber) async {
  await launch("tel:$phoneNumber");
}

Future<void> sendSMS(String phoneNumber) async {
  await launch("sms:$phoneNumber");
}

Future<void> sendEmail(String email) async {
  await launch("mailto:$email");
}

Future<void> openURL(
  String url, {
  bool forceWebView = false,
  bool enableJavascript = false,
}) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceWebView: forceWebView,
      enableJavaScript: enableJavascript,
    );
  }
}
