import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  var theme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xfff25723)), //button color
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    )),
    textTheme: GoogleFonts.robotoTextTheme(),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      color: Colors.black,
    ),
  );
}
