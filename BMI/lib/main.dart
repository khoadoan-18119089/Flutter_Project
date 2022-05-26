import 'package:flutter/material.dart';
import 'screens/input.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme(
              color: Color(0xFF090C22),
            ),
            scaffoldBackgroundColor: const Color(0xFF090C22),
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
            textTheme:
                const TextTheme(bodyText1: TextStyle(color: Colors.white))),
        home: const Input());
  }
}
