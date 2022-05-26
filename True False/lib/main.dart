import 'package:flutter/material.dart';
import 'project.dart';

void main(List<String> args) {
  return runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Quiz()),
    ),
  ));
}
