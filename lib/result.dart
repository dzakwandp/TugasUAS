
import 'package:flutter/material.dart';
import 'survey.dart' as survey;

int hasil=survey.percentage;
class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan,
        body: tampilHasil(context),
      ),
    );
  }
}

tampilHasil(BuildContext context){
  if (hasil >= 60) {
    Text("Persentase anda terjangkit COVID-19: $hasil%\nSilahkan kunjungi fasilitas kesehatan terdekat.");
  } else {
    Text("Persentase anda terjangkit COVID-19: $hasil%\nTetap jaga kesehatan dan patuhi protokol kesehatan dari pemerintah.");
  }
}
