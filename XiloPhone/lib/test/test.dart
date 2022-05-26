import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Xilophone extends StatefulWidget {
  const Xilophone({Key? key}) : super(key: key);

  @override
  State<Xilophone> createState() => _XilophoneState();
}

class _XilophoneState extends State<Xilophone> {
  Expanded key(Color color, int num) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          play(num);
        },
        child: const Text(''),
        color: color,
      ),
    );
  }

  void play(int num) {
    AudioCache play = AudioCache();
    play.play('assets_note$num.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        key(Colors.red,1),
        key(Colors.orange,2),
        key(Colors.yellow,3),
        key(Colors.green,4),
        key(Colors.teal,5),
        key(Colors.blue,6),
        key(Colors.purple,7),
      ],
    );
  }
}
