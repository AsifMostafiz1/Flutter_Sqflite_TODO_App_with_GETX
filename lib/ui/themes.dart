import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes{
  static final light = ThemeData(
    primaryColor: Colors.blue,

    appBarTheme: const AppBarTheme(
      color: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
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