import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[200]!,
    iconTheme: IconThemeData(color: Colors.grey[400])
  ),
  colorScheme: ColorScheme.dark(
    background: Colors.grey[900]!,
    primary: Colors.white,
    secondary: Colors.grey[700]!,
    tertiary: Colors.grey[800],
    inversePrimary: Colors.black
  ),
    textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.white) 
    )
);