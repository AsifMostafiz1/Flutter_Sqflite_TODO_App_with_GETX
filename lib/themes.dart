import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo/services/theme_services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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

TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ThemeServices().mode?Colors.grey[400]:Colors.grey

  );
}
TextStyle get headingStyle{
  return GoogleFonts.lato(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: ThemeServices().mode?Colors.white:Colors.black54

  );

}

TextStyle get titleTextStyle{
  return GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ThemeServices().mode?Colors.white:Colors.black54

  );

}

TextStyle get subTitleTextStyle{
  return GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: ThemeServices().mode?Colors.white:Colors.black54

  );

}


