//import 'dart:js';

import 'homeview.dart';
import 'package:flutter/material.dart';
import 'varglob.dart' as globals;

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
            },
          ),
        ),
        body: RadioApp(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
enum Pilihan { a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t }

class RadioApp extends StatefulWidget {
  RadioApp({Key key}) : super(key: key);

  @override
  _RadioAppState createState() => _RadioAppState();
}

class _RadioAppState extends State<RadioApp> {
  Pilihan _character1;
  Pilihan _character2;
  Pilihan _character3;
  Pilihan _character4;
  Pilihan _character5;
  Pilihan _character6;
  Pilihan _character7;
  Pilihan _character8;
  Pilihan _character9;
  Pilihan _character10;
  int _total = 0;
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.question_answer),
                title: Text(
                    'Silahkan jawab pertanyaan dibawah ini sesuai dengan kondisi anda.'),
                subtitle: Text('Data tidak akan kami sebar luaskan'),
              ),
              const ListTile(
                title: Text(
                    '1. Apakah Anda memiliki riwayat demam selama 2 minggu terakhir?'),
              ),
              ListTile(
                title: Text('Iya'),
                leading: Radio(
                  value: Pilihan.a,
                  groupValue: _character1,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character1 = value;
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('Tidak'),
                leading: Radio(
                  value: Pilihan.b,
                  groupValue: _character1,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character1 = value;
                      },
                    );
                  },
                ),
              ),
              const ListTile(
                title: Text(
                    '2. Apakah Anda memiliki riwayat batuk/pilek selama 2 minggu terakhir?'),
              ),
              ListTile(
                title: Text('Iya'),
                leading: Radio(
                  value: Pilihan.c,
                  groupValue: _character2,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character2 = value;
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('Tidak'),
                leading: Radio(
                  value: Pilihan.d,
                  groupValue: _character2,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character2 = value;
                      },
                    );
                  },
                ),
              ),
              const ListTile(
                title: Text(
                    '3. Apakah Anda memiliki riwayat nyeri pada tenggorokan 2 minggu terakhir?'),
              ),
              ListTile(
                title: Text('Iya'),
                leading: Radio(
                  value: Pilihan.e,
                  groupValue: _character3,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character3 = value;
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('Tidak'),
                leading: Radio(
                  value: Pilihan.f,
                  groupValue: _character3,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character3 = value;
                      },
                    );
                  },
                ),
              ),
              const ListTile(
                title: Text(
                    '4. Apakah Anda memiliki riwayat sesak nafas selama 2 minggu terakhir?'),
              ),
              ListTile(
                title: Text('Iya'),
                leading: Radio(
                  value: Pilihan.g,
                  groupValue: _character4,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character4 = value;
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('Tidak'),
                leading: Radio(
                  value: Pilihan.h,
                  groupValue: _character4,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character4 = value;
                      },
                    );
                  },
                ),
              ),
              const ListTile(
                title: Text(
                    '5. Apakah Anda memiliki riwayat perjalanan ke luar negeri dalam waktu 2 minggu terakhir?'),
              ),
              ListTile(
                title: Text('Iya'),
                leading: Radio(
                  value: Pilihan.i,
                  groupValue: _character5,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character5 = value;
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('Tidak'),
                leading: Radio(
                  value: Pilihan.j,
                  groupValue: _character5,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character5 = value;
                      },
                    );
                  },
                ),
              ),
              const ListTile(
                title: Text(
                    '6. Apakah Anda memiliki riwayat perjalanan ke luar kota dalam waktu 2 minggu terakhir?'),
              ),
              ListTile(
                title: Text('Iya'),
                leading: Radio(
                  value: Pilihan.k,
                  groupValue: _character6,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character6 = value;
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('Tidak'),
                leading: Radio(
                  value: Pilihan.l,
                  groupValue: _character6,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character6 = value;
                      },
                    );
                  },
                ),
              ),
              const ListTile(
                title: Text(
                    '7. Apakah Anda memiliki riwayat kontak erat dengan pasien kasus positif COVID-19?'),
              ),
              ListTile(
                title: Text('Iya'),
                leading: Radio(
                  value: Pilihan.m,
                  groupValue: _character7,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character7 = value;
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('Tidak'),
                leading: Radio(
                  value: Pilihan.n,
                  groupValue: _character7,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character7 = value;
                      },
                    );
                  },
                ),
              ),
              const ListTile(
                title: Text(
                    '8. Apakah Anda memiliki riwayat mengunjungi wilayah industri yang terkena zona merah COVID-19?'),
              ),
              ListTile(
                title: Text('Iya'),
                leading: Radio(
                  value: Pilihan.o,
                  groupValue: _character8,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character8 = value;
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('Tidak'),
                leading: Radio(
                  value: Pilihan.p,
                  groupValue: _character8,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character8 = value;
                      },
                    );
                  },
                ),
              ),
              const ListTile(
                title: Text(
                    '9. Apakah Anda memiliki riwayat mengunjungi fasilitas kesehatan yang terkena zona merah COVID-19?'),
              ),
              ListTile(
                title: Text('Iya'),
                leading: Radio(
                  value: Pilihan.q,
                  groupValue: _character9,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character9 = value;
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('Tidak'),
                leading: Radio(
                  value: Pilihan.r,
                  groupValue: _character9,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character9 = value;
                      },
                    );
                  },
                ),
              ),
              const ListTile(
                title: Text(
                    '10. Apakah Anda memiliki riwayat suhu tubuh melebihi 38 derajat celcius dalam 2 minggu terakhir?'),
              ),
              ListTile(
                title: Text('Iya'),
                leading: Radio(
                  value: Pilihan.s,
                  groupValue: _character10,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character10 = value;
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('Tidak'),
                leading: Radio(
                  value: Pilihan.t,
                  groupValue: _character10,
                  onChanged: (Pilihan value) {
                    setState(
                      () {
                        _character10 = value;
                      },
                    );
                  },
                ),
              ),
              RaisedButton(
                onPressed: () {
                  if (_character1 == Pilihan.a) {
                    _total++;
                  } else {}
                  if (_character2 == Pilihan.c) {
                    _total++;
                  } else {}
                  if (_character3 == Pilihan.e) {
                    _total++;
                  } else {}
                  if (_character4 == Pilihan.g) {
                    _total++;
                  } else {}
                  if (_character5 == Pilihan.i) {
                    _total++;
                  } else {}
                  if (_character6 == Pilihan.k) {
                    _total++;
                  } else {}
                  if (_character7 == Pilihan.m) {
                    _total++;
                  } else {}
                  if (_character8 == Pilihan.o) {
                    _total++;
                  } else {}
                  if (_character9 == Pilihan.q) {
                    _total++;
                  } else {}
                  if (_character10 == Pilihan.s) {
                    _total++;
                  } else {}
                  if (_total >= 6) {
                    _popupplus();
                  } else {
                    _popupmin();
                  }
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _popupplus() async {
  String _nama;
    _nama = globals.nama;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Hello $_nama'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("Potensi Anda untuk positif COVID-19 tinggi\nSilahkan laukan medical check-up di instansi kesehatan terdekat."),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ],
      );
    },
  );
}

Future<void> _popupmin() async {
  String _nama;
    _nama = globals.nama;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Hello $_nama'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("Potensi Anda untuk positif COVID-19 rendah\nTetap jaga kesehatan, dan patuhi protokol kesehatan dari pemerintah."),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ],
      );
    },
  );
}
}
