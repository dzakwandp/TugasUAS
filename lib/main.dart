import 'package:Halo_Halo/pages/pages.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashScreenPage(),
        '/loginPage': (context) => LoginPage(),
        '/surveyPage': (context) => Survey(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Corona Checker',
      theme: ThemeData(primarySwatch: Colors.cyan, fontFamily: 'Montserrat'),
    );
  }
}
