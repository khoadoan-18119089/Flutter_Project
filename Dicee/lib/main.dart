import 'package:flutter/material.dart';
import 'dart:math';

void main(List<String> args) {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Center(
            child: Text(
              'decee',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico'),
            ),
          )),
      body: const SafeArea(child: Dicee()),
      backgroundColor: Colors.red,
    ),
  ));
}

class Dicee extends StatefulWidget {
  const Dicee({Key? key}) : super(key: key);

  @override
  _DiceeState createState() => _DiceeState();
}

class _DiceeState extends State<Dicee> {
  int leftnumber = 1;
  int rightnumber = 1;
  void tinh() {
    setState(() {
      leftnumber = Random().nextInt(6) + 1;
      rightnumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: FlatButton(
                  child: Image.asset('images/dice$leftnumber.png'),
                  onPressed: tinh)),
          Expanded(
              flex: 1,
              child: FlatButton(
                  child: Image.asset('images/dice$rightnumber.png'),
                  onPressed: tinh)),
        ],
      ),
    );
  }
}
