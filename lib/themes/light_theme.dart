import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[200]!,
    iconTheme: IconThemeData(color: Colors.grey[400])
  ),
  colorScheme: ColorScheme.light(
    background: Colors.grey[200]!,
    primary: Colors.black,
    secondary: Colors.grey[400]!,
    inversePrimary: Colors.white,
    tertiary: Colors.white
  ),
    textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.black) 
    )
);