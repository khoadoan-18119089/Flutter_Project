import 'package:chat_app/common/color.dart';
import 'package:chat_app/common/theme/text_theme.dart';
import 'package:flutter/material.dart';

AppBarTheme internAppBarTheme = AppBarTheme(
  backgroundColor: InternColor.white,
  elevation: 0,
  titleTextStyle: internTextTheme.headline6?.copyWith(color: InternColor.white),
);
