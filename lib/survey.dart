//import 'dart:js';

import 'package:Halo_Halo/homeview.dart';
import 'package:flutter/material.dart';

class Survey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Surveys'),
          leading: IconButton(
              icon: const Icon(Icons.navigate_before),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }),
        ),
        body: RadioApp(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
enum Pilihan { a, b, c, d, e, f, g, h, i, j, k, l, m, o, p, q, r, s, t, u}
class RadioApp extends StatefulWidget {
  RadioApp({Key key}) : super(key: key);

  @override
  _RadioAppState createState() => _RadioAppState();
}

class _RadioAppState extends State<RadioApp> {
  Pilihan _character = Pilihan.a;

  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('Silahkan jawab pertanyaan dibawah ini sesuai dengan kondisi anda.'),
              subtitle: Text('Data tidak akan kami sebar luaskan'),
            ),
            const ListTile(
              title: Text('1. Apakah anda memiliki riwayat demam selama 2 minggu terakhir?'),
            ),
            ListTile(
              title: Text('Iya'),
              leading: Radio(value: Pilihan.a, 
              groupValue: _character, 
              onChanged: (Pilihan value){
                setState(() {
                _character = value;
              });
              })),
              ListTile(
              title: Text('Tidak'),
              leading: Radio(value: Pilihan.b, 
              groupValue: _character, 
              onChanged: (Pilihan value){
                setState(() {
                _character = value;
              });
              }))
          ],
        ),
      ),
    );
  }
}
