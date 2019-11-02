import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNo) {
    final player = AudioCache();
    player.play('note$soundNo.wav');
  }

  Expanded buildKey({Color btnColor, int soundNo}) {
    return Expanded(
      child: FlatButton(
        color: btnColor,
        onPressed: () {
          playSound(soundNo);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKey(btnColor: Colors.red, soundNo: 1),
            buildKey(btnColor: Colors.orange, soundNo: 2),
            buildKey(btnColor: Colors.yellow, soundNo: 3),
            buildKey(btnColor: Colors.green, soundNo: 4),
            buildKey(btnColor: Colors.blue, soundNo: 5),
            buildKey(btnColor: Colors.indigo, soundNo: 6),
            buildKey(btnColor: Colors.purple, soundNo: 7)
          ],
        )),
      ),
    );
  }
}
