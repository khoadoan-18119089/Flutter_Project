import 'package:flutter/material.dart';
import 'package:youtube_clone/my_app/theme/color.dart';

class ThemeDataApp {
  ThemeDataApp._();
  static ThemeData get dartTheme => ThemeData.dark().copyWith(
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: ColorData.primaryBlack),
        appBarTheme: AppBarTheme(
          titleTextStyle: _titleLarge(color: Colors.white),
        ),
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: _textThemeDark,
        splashColor: Colors.grey.shade900,
        highlightColor: Colors.grey.shade700,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey.shade900,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedIconTheme: _iconThemeData(color: Colors.white),
          unselectedIconTheme: _iconThemeData(color: Colors.white),
          selectedLabelStyle: _lableSmall(color: Colors.black),
          unselectedLabelStyle: _lableSmall(color: Colors.black),
        ),
        cardTheme: _cardTheme(color: Colors.grey.shade900),
        bottomSheetTheme: _bottomSheetTheme(color: Colors.grey.shade900),
        iconTheme: _iconThemeData(color: Colors.white),
        sliderTheme: _sliderThemeData(),
        dividerTheme: _dividerThemeData(color: Colors.grey.shade900),
        outlinedButtonTheme:
            _outlinedButtonThemeData(foregroundColor: Colors.white),
        elevatedButtonTheme:
            _elevatedButtonThemeData(foregroundColor: Colors.white),
        textButtonTheme: _textButtonThemeData(foregroundColor: Colors.white),
      );

  static ThemeData get lightTheme => ThemeData.light().copyWith(
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: ColorData.primaryWhite),
        appBarTheme: AppBarTheme(
          titleTextStyle: _titleLarge(color: Colors.black),
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: _textThemeLight,
        splashColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade700,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey.shade300,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          selectedIconTheme: _iconThemeData(color: Colors.black),
          unselectedIconTheme: _iconThemeData(color: Colors.black),
          selectedLabelStyle: _lableSmall(color: Colors.white),
          unselectedLabelStyle: _lableSmall(color: Colors.white),
        ),
        cardTheme: _cardTheme(color: Colors.grey.shade500),
        bottomSheetTheme: _bottomSheetTheme(color: Colors.grey.shade300),
        iconTheme: _iconThemeData(color: Colors.black),
        sliderTheme: _sliderThemeData(),
        dividerTheme: _dividerThemeData(color: Colors.grey.shade300),
        outlinedButtonTheme:
            _outlinedButtonThemeData(foregroundColor: Colors.black),
        elevatedButtonTheme:
            _elevatedButtonThemeData(foregroundColor: Colors.black),
        textButtonTheme: _textButtonThemeData(foregroundColor: Colors.black),
      );

  static TextTheme get _textThemeDark => TextTheme(
        titleLarge: _titleLarge(color: Colors.white),
        titleMedium: _titleMedium(color: Colors.white),
        titleSmall: _titleSmall(color: Colors.white),
        bodyLarge: _bodyLarge(color: Colors.white),
        bodyMedium: _bodyMedium(color: Colors.white),
        bodySmall: _bodySmall(color: Colors.white),
        labelLarge: _lableLarge(color: Colors.white),
        labelMedium: _lableMedium(color: Colors.white),
        labelSmall: _lableSmall(color: Colors.white),
      );

  static TextTheme get _textThemeLight => TextTheme(
        titleLarge: _titleLarge(color: Colors.black),
        titleMedium: _titleMedium(color: Colors.black),
        titleSmall: _titleSmall(color: Colors.black),
        bodyLarge: _bodyLarge(color: Colors.black),
        bodyMedium: _bodyMedium(color: Colors.black),
        bodySmall: _bodySmall(color: Colors.black),
        labelLarge: _lableLarge(color: Colors.black),
        labelMedium: _lableMedium(color: Colors.black),
        labelSmall: _lableSmall(color: Colors.black),
      );

  static TextStyle _titleLarge({required Color color}) => TextStyle(
        fontSize: 24,
        color: color,
        fontFamily: 'Roboto',
      );

  static TextStyle _titleMedium({required Color color}) => TextStyle(
        fontSize: 22,
        color: color,
        fontFamily: 'Roboto',
      );

  static TextStyle _titleSmall({required Color color}) => TextStyle(
        fontSize: 20,
        color: color,
        fontFamily: 'Roboto',
      );

  static TextStyle _bodyLarge({required Color color}) => TextStyle(
        fontSize: 18,
        color: color,
        fontFamily: 'Roboto',
      );

  static TextStyle _bodyMedium({required Color color}) => TextStyle(
        fontSize: 16,
        color: color,
        fontFamily: 'Roboto',
      );

  static TextStyle _bodySmall({required Color color}) => TextStyle(
        fontSize: 14,
        color: color,
        fontFamily: 'Roboto',
      );

  static TextStyle _lableLarge({required Color color}) => TextStyle(
        fontSize: 12,
        color: color,
        fontFamily: 'Roboto',
      );

  static TextStyle _lableMedium({required Color color}) => TextStyle(
        fontSize: 10,
        color: color,
        fontFamily: 'Roboto',
      );

  static TextStyle _lableSmall({required Color color}) => TextStyle(
        fontSize: 8,
        color: color,
        fontFamily: 'Roboto',
      );

  static CardTheme _cardTheme({required Color color}) => CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        color: color,
        clipBehavior: Clip.antiAlias,
      );
  static BottomSheetThemeData _bottomSheetTheme({required Color color}) =>
      BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: color,
      );

  static IconThemeData _iconThemeData({required Color color}) => IconThemeData(
        color: color,
        size: 30,
      );

  static SliderThemeData _sliderThemeData() => SliderThemeData(
        trackHeight: 2,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5.0),
        overlayShape: SliderComponentShape.noOverlay,
        activeTrackColor: Colors.red,
        thumbColor: Colors.red,
        inactiveTrackColor: Colors.white,
      );

  static DividerThemeData _dividerThemeData({required Color color}) =>
      DividerThemeData(
        space: 2,
        color: color,
      );

  static TextButtonThemeData _textButtonThemeData(
          {required Color foregroundColor}) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      );

  static OutlinedButtonThemeData _outlinedButtonThemeData(
          {required Color foregroundColor}) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          side: BorderSide(
            color: Colors.grey.shade500,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: const Size(0, 0),
        ),
      );

  static ElevatedButtonThemeData _elevatedButtonThemeData(
          {required Color foregroundColor}) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      );
}
