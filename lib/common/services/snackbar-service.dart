import 'package:flutter/material.dart';
import 'package:no/common/theme/app-theme.dart';

class SnackBarService {
  displaySnackBar({
    GlobalKey<ScaffoldState> scaffoldKey,
    String text,
    int seconds = 5,
    Color background = Colors.white,
    Color textColor = colorPrimaryDark }) {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          backgroundColor: background,
          content: Text( text,
            style: TextStyle( color: textColor ),
          ),
          duration: Duration( seconds: seconds ),
        )
      );
  }
}