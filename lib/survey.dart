import 'package:CoCheck/homeview.dart';
import 'result.dart';
import 'package:flutter/material.dart';

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
int percentage = 0;
String content = '';
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

  for (final value in answer.values) {
    if (value == Options.None) {
      _isValid = false;
      break;
    } else if (value == Options.Iya) {
      percentage += 10;
      _isValid = true;
    }
      if (hasil >= 60) {
    content =
       ("SANGAT TINGGI\nSilahkan kunjungi fasilitas kesehatan terdekat.");
  } else {
    content =
        ("RENDAH \nTetap jaga kesehatan dan patuhi protokol kesehatan dari pemerintah.");
  }
  }
  _isValid
      ? Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Result()))
      : showAlertDialog(context, 'Perhatian!',
          'Silahkan isi semua survey terlebih dahulu!!!');
}

// void nextPage(){
//   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
// }

void showAlertDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => new AlertDialog(
      title: new Text(title),
      content: new Text(content),
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
}
