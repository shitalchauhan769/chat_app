import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: green,iconTheme: IconThemeData(color: Colors.white),titleTextStyle: TextStyle(color: Colors.white,fontSize: 20)),
    colorSchemeSeed: green,
  iconTheme: const IconThemeData(color: Colors.white),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(selectedIconTheme: IconThemeData(color: Colors.black),)



);
ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(color: green,iconTheme: IconThemeData(color: Colors.white),titleTextStyle: TextStyle(color: Colors.white,fontSize: 20)),
    colorSchemeSeed: green,
  iconTheme: const IconThemeData(color: Colors.white),
);
