import 'package:flutter/material.dart';

import 'constants/colors.dart';

ThemeData kAppTheme = ThemeData(
  primaryColor: kPrimaryColor,
  highlightColor: kHighlightColor,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white, elevation: 0),
  fontFamily: 'PlayFair',
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 34,
    ),
    displayMedium: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 26,
    ),
    displaySmall: TextStyle(
        color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 20),
    headlineMedium: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 13,
        fontFamily: 'Roboto'),
    headlineSmall: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    titleLarge: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    titleMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 13,
    ),
    bodyLarge: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w300,
        fontSize: 15,
        fontFamily: 'Roboto',
        height: 1.4),
    bodySmall: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        fontFamily: 'Roboto'),
  ),
);
