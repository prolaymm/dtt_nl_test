// ignore_for_file: use_full_hex_values_for_flutter_colors

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
    errorColor: const  Color(0xffFF0000),
    appBarTheme: const AppBarTheme(
      color: cScaffoldBackground,
      titleTextStyle: TextStyle(color: Colors.black),
      elevation:0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    cardColor: cScaffoldBackground,
    cardTheme: const CardTheme(
      color:cScaffoldBackground,
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
      bodyText2: TextStyle(color: Colors.black),
      headline1: TextStyle(color: cPrimaryColor),
      subtitle1: TextStyle(color: cHintColor),
      caption: TextStyle(color: cPrimaryColor),
    ),
    buttonTheme: const ButtonThemeData(buttonColor: cPrimaryColor),
  );


}
