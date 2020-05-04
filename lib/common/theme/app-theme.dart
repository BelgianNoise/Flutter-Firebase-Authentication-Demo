import 'package:flutter/material.dart';

const Color colorPrimary = Color ( 0xFF663399 ); // Colors.indigo[500]
const Color colorPrimaryDark = Color ( 0xFF552288 ); // Colors.indigo[700]
const Color colorAccent = Color( 0xFFFFC107 ); // Colors.amber

ThemeData appTheme = ThemeData(
  primaryColor: colorPrimary,
  primaryColorDark: colorPrimaryDark,
  accentColor: colorAccent,
  accentColorBrightness: Brightness.dark,
);