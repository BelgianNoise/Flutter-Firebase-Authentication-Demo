import 'package:flutter/material.dart';

const Color colorPrimary = Color ( 0xFF3F51B5 ); // Colors.indigo[500]
const Color colorPrimaryDark = Color ( 0xFF303F9F ); // Colors.indigo[700]
const Color colorAccent = Color( 0xFFFFC107 ); // Colors.amber

ThemeData appTheme = ThemeData(
  primaryColor: colorPrimary,
  primaryColorDark: colorPrimaryDark,
  accentColor: colorAccent,
  accentColorBrightness: Brightness.dark,
);