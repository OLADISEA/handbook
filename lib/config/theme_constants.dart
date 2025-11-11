import 'package:flutter/material.dart';

class ThemeConstants {
  static ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
        background: Color(0xffffffff),
        primary: Colors.grey.shade500,
        secondary: Colors.grey.shade200,
        inversePrimary: Color(0XFF342F3F),
        tertiary: Colors.grey.shade600,
        onPrimary: Colors.black,
        onError: Colors.black,
        onSecondary: Colors.white
    ),
  );

  static ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
        background: Color(0XFF1D182A),
        primary: Colors.grey.shade600,
        secondary: Colors.grey.shade800,
        inversePrimary: Color(0XFF342F3F),
        tertiary: Color(0XFF342F3F),
        onPrimary: Color(0xffffffff),
        onError: Colors.white,
        onSecondary: Colors.white

    ),
  );
}
