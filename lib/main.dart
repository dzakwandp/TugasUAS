import 'package:Halo_Halo/pages/login_page.dart';
import 'package:Halo_Halo/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Corona Checker',
      theme: ThemeData(primarySwatch: Colors.cyan, fontFamily: 'Montserrat'),
      home: SplashScreenPage(),
    );
  }
}
