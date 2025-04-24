import 'package:flutter/material.dart';

class AppTheme {
  final colorLightAppScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 124, 38, 123),
    onPrimary: Colors.white,
    secondary: Color.fromARGB(255, 255, 126, 126),
    onSecondary: Colors.white,
    error: Colors.redAccent,
    onError: Colors.yellow,
    background: Color.fromARGB(255, 255, 255, 255),
    onBackground: Colors.white,
    surface: Color.fromARGB(255, 247, 245, 245),
    onSurface: Colors.black,
  );

  final appTextTheme = TextTheme(
    //Títulos
    titleLarge: TextStyle(
      fontSize: 30,
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),

    //Texto en pantalla
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
    bodySmall: TextStyle(fontSize: 16, color: Colors.white),

    //Etiquetas o textos breves
    labelSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.grey[500],
    ),
    labelMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  final iconTheme = const IconThemeData(
    color: Color.fromARGB(255, 124, 38, 123),
  );

  final appFilledButtonTheme = const ButtonThemeData();
  final appOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: Color.fromARGB(255, 124, 38, 123)),
    ),
  );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorScheme: colorLightAppScheme,
    textTheme: appTextTheme,
    outlinedButtonTheme: appOutlinedButtonTheme,
    iconTheme: iconTheme,
  );
}
