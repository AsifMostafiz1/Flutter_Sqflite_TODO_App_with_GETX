import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes{
  static final light = ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
            statusBarIconBrightness: Brightness.dark,

      ),
    ),
  );

  static final dark = ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      brightness: Brightness.dark
  );
}