import 'package:CoCheck/homeview.dart';
import 'package:flutter/material.dart';
import './varglob.dart' as globals;

const questions = [
  'Apakah Anda memiliki riwayat demam selama 2 minggu terakhir?',
  'Apakah Anda memiliki riwayat batuk/pilek selama 2 minggu terakhir?',
  'Apakah Anda memiliki riwayat nyeri pada tenggorokan 2 minggu terakhir?',
  'Apakah Anda memiliki riwayat sesak nafas selama 2 minggu terakhir?',
  'Apakah Anda memiliki riwayat perjalanan ke luar negeri dalam waktu 2 minggu terakhir?',
  'Apakah Anda memiliki riwayat perjalanan ke luar kota dalam waktu 2 minggu terakhir?',
  'Apakah Anda memiliki riwayat kontak erat dengan pasien kasus positif COVID-19?',
  'Apakah Anda memiliki riwayat mengunjungi wilayah industri yang terkena zona merah COVID-19?',
  'Apakah Anda memiliki riwayat mengunjungi fasilitas kesehatan yang terkena zona merah COVID-19?',
  'Apakah Anda memiliki riwayat suhu tubuh melebihi 38 derajat celcius dalam 2 minggu terakhir?',
];

enum Options { Iya, Tidak, None }
bool _isValid = false;
Map<String, Options> answer = {};

void initializeAnswer() {
  for (int i = 1; i <= questions.length; i++) {
    answer['answer$i'] = Options.None;
  }
}

Options option1;

class Survey extends StatefulWidget {
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  void initState() {
    super.initState();
    initializeAnswer();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.navigate_before),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.help),
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
                    new Text("Aplikasi ini dibuat dengan tujuan memenuhi tugas UAS dari matakuliah Pemrograman Perangkat Bergerak.\n\nSekaligus memiliki tujuan agar masyarakat dapat mendeteksi infeksi virus Covid-19 secara dini.\n\nDeveloper Teams:\nDzakwan Diego\nTaufiq Dimas\ndkk.", textAlign: TextAlign.justify,),
                    Text("\nUniversitas Diponegoro\n2020.", textAlign: TextAlign.center, textScaleFactor: 0.8,)
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
          backgroundColor: Colors.cyan,
          centerTitle: true,
          elevation: 10.0,
          title: Text(
            'Survey',
          ),
        ),
        body: _myListView(context),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              calculateResult(context);
            });
          },
          label: Text('Submit'),
          icon: Icon(Icons.thumb_up),
          backgroundColor: Colors.cyan,
          elevation: 5.0,
          tooltip: 'Submit untuk melihat hasilnya',
        ),
      ),
    );
  }

  Widget _myListView(BuildContext context) {
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
          elevation: 5.0,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  '${index + 1}. ${questions[index]}',
                ),
              ),
              ListTile(
                title: const Text('Iya'),
                leading: Radio(
                  value: Options.Iya,
                  groupValue: answer['answer${index + 1}'],
                  onChanged: (Options value) {
                    setState(
                      () {
                        answer['answer${index + 1}'] = value;
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: const Text('Tidak'),
                leading: Radio(
                  value: Options.Tidak,
                  groupValue: answer['answer${index + 1}'],
                  onChanged: (Options value) {
                    setState(
                      () {
                        answer['answer${index + 1}'] = value;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

void calculateResult(BuildContext context) {
  var _nama = globals.nama;
  int _percentage = 0;
  String _content = '';

  for (final value in answer.values) {
    if (value == Options.None) {
      _isValid = false;
      break;
    } else if (value == Options.Iya) {
      _percentage += 10;
      _isValid = true;
    }
  }
  if (_percentage >= 60) {
    _content =
        "Persentase anda terjangkit COVID-19: $_percentage%\nSilahkan kunjungi fasilitas kesehatan terdekat.";
  } else {
    _content =
        "Persentase anda terjangkit COVID-19: $_percentage%\nTetap jaga kesehatan dan patuhi protokol kesehatan dari pemerintah.";
  }
  _isValid
      ? showAlertDialog(context, 'Halo $_nama!', _content)
      : showAlertDialog(context, 'Perhatian!',
          'Silahkan isi semua survey terlebih dahulu!!!');
}

void showAlertDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    barrierDismissible: _isValid ? false : true,
    builder: (_) => new AlertDialog(
      title: new Text(title),
      content: new Text(content),
      actions: <Widget>[
        FlatButton(
          child: _isValid ? Text('Home') : Text("Tutup"),
          onPressed: () {
            _isValid
                ? Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()))
                : Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
