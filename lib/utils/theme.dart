import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: green),
    colorSchemeSeed: green,
  iconTheme: const IconThemeData(color: Colors.white),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(selectedIconTheme: IconThemeData(color: Colors.black),)



);
ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(color: green),
    colorSchemeSeed: green,
  iconTheme: const IconThemeData(color: Colors.white),
);
