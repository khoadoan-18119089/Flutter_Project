import 'dart:math';

import 'package:flutter/material.dart';

class Abc extends StatefulWidget {
  const Abc({Key? key}) : super(key: key);

  @override
  _AbcState createState() => _AbcState();
}

class _AbcState extends State<Abc> {
  int ballnumber = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    ballnumber = Random().nextInt(5) + 1;
                  });
                },
                child: Image.asset('images/ball$ballnumber.png')))
      ],
    );
  }
}
