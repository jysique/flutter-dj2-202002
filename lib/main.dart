import 'package:flutter/material.dart';
import 'package:flutter_app/features/splash_screen.dart';

void main() {
  runApp(new MaterialApp(
    theme: new ThemeData(
      primaryColor: Colors.white
    ),
    home: SplashScreen(),
  ));
}
