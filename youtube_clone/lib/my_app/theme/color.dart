import 'package:flutter/material.dart';

class ColorData {
  static const MaterialColor primaryBlack = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(_blackPrimaryValue),
      100: Color(_blackPrimaryValue),
      200: Color(_blackPrimaryValue),
      300: Color(_blackPrimaryValue),
      400: Color(_blackPrimaryValue),
      500: Color(_blackPrimaryValue),
      600: Color(_blackPrimaryValue),
      700: Color(_blackPrimaryValue),
      800: Color(_blackPrimaryValue),
      900: Color(_blackPrimaryValue),
    },
  );
  static const int _blackPrimaryValue = 0xFF000000;

    static const MaterialColor primaryWhite = MaterialColor(
    _whitePrimaryValue,
    <int, Color>{
      50: Color(_whitePrimaryValue),
      100: Color(_whitePrimaryValue),
      200: Color(_whitePrimaryValue),
      300: Color(_whitePrimaryValue),
      400: Color(_whitePrimaryValue),
      500: Color(_whitePrimaryValue),
      600: Color(_whitePrimaryValue),
      700: Color(_whitePrimaryValue),
      800: Color(_whitePrimaryValue),
      900: Color(_whitePrimaryValue),
    },
  );
  static const int _whitePrimaryValue = 0xFFFFFFFF;
}
