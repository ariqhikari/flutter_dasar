import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer audioPlayer;
  String duration = "00:00:00";

  _MyAppState() {
    audioPlayer = AudioPlayer();
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        print("Odading " + event.toString());
        duration = event.toString();
      });
      audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    });
  }

  void playSound(String url) async {
    await audioPlayer.seek(Duration(seconds: 30));
    await audioPlayer.play(url);
  }

  void pauseSound() async {
    await audioPlayer.pause();
  }

  void stopSound() async {
    await audioPlayer.stop();
  }

  void resumeSound() async {
    await audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Playing Music")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text("Play"),
                onPressed: () {
                  playSound(
                      "http://dl17.freemp3downloads.online/file/youtubedGcGbF4ex5o128.mp3?fn=Sheila%20on%207%20-%20Dan.mp3");
                },
              ),
              RaisedButton(
                child: Text("Pause"),
                onPressed: () {
                  pauseSound();
                },
              ),
              RaisedButton(
                child: Text("Stop"),
                onPressed: () {
                  stopSound();
                },
              ),
              RaisedButton(
                child: Text("Resume"),
                onPressed: () {
                  resumeSound();
                },
              ),
              Text(
                duration,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
