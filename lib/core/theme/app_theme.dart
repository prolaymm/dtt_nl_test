import 'package:flutter/material.dart';

import '../../utils/const_color.dart';


class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    primaryColor: cPrimaryColor,
    hintColor:  cHintColor,
    scaffoldBackgroundColor: cScaffoldBackground,
    backgroundColor: Colors.white,
    shadowColor:  cShadowColor,
    appBarTheme: const AppBarTheme(
      color: cScaffoldBackground,
      titleTextStyle: TextStyle(color: Colors.black),
      elevation:0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    inputDecorationTheme:
        const InputDecorationTheme(fillColor: Color(0xffE5E5E5)),
    colorScheme: ColorScheme.fromSwatch().copyWith(
        //  secondary: primaryColor,
        secondaryContainer: Colors.white,
        onPrimary: Colors.black,
        primary: cPrimaryColor,
        shadow: const Color.fromRGBO(239, 239, 239, 100),
        // header background color// header text color
        onSurface: Colors.blue,
        primaryContainer: cPrimaryContainer),
    textTheme: const TextTheme(
      labelMedium: TextStyle(color: Color(0xff5A596A)),
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Color(0xffcc000000)),
      headline1: TextStyle(color: cPrimaryColor),
      subtitle1: TextStyle(color: cHintColor),
      caption: TextStyle(color: cPrimaryColor),
    ),
    buttonTheme: const ButtonThemeData(buttonColor: cPrimaryColor),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textTheme: const TextTheme(
      subtitle1: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      subtitle2: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
  );
}