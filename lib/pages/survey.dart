import 'package:Halo_Halo/pages/profile_page.dart';
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

Map<String, Options> answer = {};

void initializeAnswer() {
  for (int i = 1; i <= questions.length; i++) {
    answer['answer$i'] = Options.None;
  }
}

Options option1;

bool _isValid = false;

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
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            centerTitle: true,
            elevation: 10.0,
            title: Text(
              'Survey',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ),
          ),
          body: _myListView(context),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                calculateResult(context);
              });
            },
            label: Text(
              'Submit',
              textDirection: TextDirection.ltr,
            ),
            icon: Icon(Icons.thumb_up),
            backgroundColor: Colors.cyan,
            elevation: 5.0,
            tooltip: 'Submit untuk melihat hasilnya',
          ),
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
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  'Iya',
                  textDirection: TextDirection.ltr,
                ),
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
                title: const Text(
                  'Tidak',
                  textDirection: TextDirection.ltr,
                ),
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
  int _percentage = 0;
  for (final value in answer.values) {
    if (value == Options.None) {
      _isValid = false;
      break;
    } else if (value == Options.Iya) {
      _percentage += 10;
      _isValid = true;
    }
  }

  _isValid
      ? showAlertDialog(
          context,
          'Hasil Survey',
          'Terima kasih sudah mengisi survey, untuk melihat hasilnya silahkan klik tombol dibawah,....',
          _percentage)
      : showAlertDialog(context, 'Perhatian!',
          'Silahkan isi semua survey terlebih dahulu!!!');
}

void showAlertDialog(BuildContext context, String title, String content,
    [int persentage]) {
  showDialog(
    context: context,
    barrierDismissible: !_isValid,
    builder: (_) => AlertDialog(
      title: Text(
        title,
        textDirection: TextDirection.ltr,
      ),
      content: Text(
        content,
        textDirection: TextDirection.ltr,
      ),
      actions: <Widget>[
        FlatButton(
          child: _isValid
              ? Text(
                  'Lihat!',
                  textDirection: TextDirection.ltr,
                )
              : Text(
                  'Tutup!',
                  textDirection: TextDirection.ltr,
                ),
          onPressed: () {
            _isValid
                ? Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(persentage),
                    ),
                  )
                : Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
