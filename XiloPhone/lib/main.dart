import 'package:flutter/material.dart';
import 'test/test.dart';

void main(List<String> args) {
  return runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade100,
        centerTitle: true,
        title: const Text(
          'Xilophone',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'pacifico',
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
      body: const SafeArea(child: Xilophone()),
    ),
  ));
}
