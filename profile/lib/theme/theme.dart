import 'package:flutter/material.dart';
import 'package:profile/theme/color.dart';

ThemeData get darkTheme => ThemeData(
      appBarTheme: _appbarTheme,
      scaffoldBackgroundColor: AppColor.bgColor,
    );

AppBarTheme get _appbarTheme => AppBarTheme(
      backgroundColor: AppColor.appbarColor,
    );
