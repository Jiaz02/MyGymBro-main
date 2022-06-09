import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryOrange = Color.fromARGB(255, 240, 127, 19);
  static const Color primaryBlue = Color.fromARGB(255, 56, 135, 255);

  static const Color primaryDarkOrange = Color.fromARGB(255, 165, 88, 19);
  static const Color primaryDarkBlue = Color.fromARGB(255, 24, 39, 118);

  //naranja f07f13
  //azul 274294

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      //color primario
      primaryColor: primaryBlue,

      //appbar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppTheme.primaryBlue,
        centerTitle: true,
      ),
      //textbutton
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: primaryOrange),
      ));
}
