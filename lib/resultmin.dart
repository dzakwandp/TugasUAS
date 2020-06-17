import 'package:flutter/material.dart';
import 'homeview.dart';
import 'homeview.dart' as home;

String nama = home.nama;

class ResultMin extends StatefulWidget {
  @override
  _ResultMinState createState() => _ResultMinState();
}

class _ResultMinState extends State<ResultMin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Result"),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.cyan,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.help,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (_) => new AlertDialog(
                        title: new Text("About Us"),
                        content: SizedBox(
                          height: 150.0,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                new Text(
                                  "Aplikasi ini dibuat dengan tujuan memenuhi tugas UAS dari matakuliah Pemrograman Perangkat Bergerak.\nSekaligus memiliki tujuan agar masyarakat dapat mendeteksi infeksi virus Covid-19 secara dini.\nAplikasi ini dibangun dan dapat digunakan dengan gratis, data yang tercantum pada aplikasi ini tidak sepenuhnya benar. Agar mendapat data yang lebih akurat, silahkan kunjungi layanan kesehatan terdekat.\n\nDeveloper Teams:\nDzakwan Diego P.\nTaufiq Dimas R.\ndkk.",
                                  textAlign: TextAlign.justify,
                                ),
                                Text(
                                  "\nUniversitas Diponegoro\n2020.",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 0.8,
                                )
                              ],
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Tutup"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
          backgroundColor: Colors.cyan,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text("Hallo $nama!!",
                      style: TextStyle(
                        fontSize: 48,
                        fontFamily: "Montserrat",
                        color: Colors.white,
                      ))),
              Image.asset('images/min.gif', width: 200, height: 200),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    "Potensi anda terjangkit COVID-19: RENDAH\nTetap lakukan pola hidup sehat, dan ikuti peraturan pemerintah untuk menghentikan penyebaran COIVD-19",
                    style: TextStyle(
                        fontFamily: 'Montserrat', color: Colors.white),
                  )),
              Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  child: MaterialButton(
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text("Home",
                        style: TextStyle(
                          color: Colors.cyan,
                        )),
                  ))
            ],
          )),
    );
  }
}
