import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: green),
    hintColor: Colors.white);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(color: green),
  hintColor: Colors.black,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all(
        const TextStyle(color: Colors.white),
      ),
      foregroundColor: WidgetStateProperty.all(Colors.black),
    ),
  ),
);
