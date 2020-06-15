import 'package:flutter/material.dart';
import 'splashscreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CoCheck',
      theme: ThemeData( fontFamily: "Montserrat"),
      home: SplashScreenPage(),
    ),
  );
}
