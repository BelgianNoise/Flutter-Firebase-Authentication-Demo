import 'package:flutter/material.dart';
import 'package:no/common/theme/app-theme.dart';
import 'package:no/features/login/pages/login-page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    title: 'Recepten App',
    routes: {
      '/': (context) => RALoginPage(),
    },
    theme: appTheme,
  ));
}
