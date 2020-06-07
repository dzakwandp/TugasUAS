import 'package:flutter/material.dart';
import 'homeview.dart';

class SurveyPage extends StatefulWidget {
  @override
  Surveys createState() {
    return Surveys();
  }
}

class Surveys extends State<SurveyPage>{
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
      ),
    );
  }

}