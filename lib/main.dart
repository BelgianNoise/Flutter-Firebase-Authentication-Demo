import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:no/common/services/auth-service.dart';
import 'package:no/common/theme/app-theme.dart';
import 'package:no/features/home/pages/home-page.dart';
import 'package:no/features/login/pages/login-page.dart';
import 'package:no/features/settings/pages/settings-page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(StreamProvider<FirebaseUser>.value(
    value: AuthService().user,
    child: MaterialApp(
      initialRoute: '/',
      title: 'Recepten App',
      routes: {
        '/': (context) => Provider.of<FirebaseUser>(context) == null ? RALoginPage() : RAHomePage(),
        '/settings': (context) => RASettingsPage(),
      },
      theme: appTheme,
    ),
  ));
}
