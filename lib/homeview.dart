import 'dart:async';
import 'survey.dart';
import 'package:flutter/material.dart';
import 'varglob.dart' as globals;

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  String _nama;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/logo.png', //width: 200.0,
            //height: 200.0,
          ),
          Text(
            'Masukkan Nama Anda:\n',
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 50, left: 50),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: _controller,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                prefixIcon: Icon(Icons.account_circle),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 3)),
                fillColor: Colors.white,
                focusColor: Colors.white,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.cyan,
            child: MaterialButton(
              //minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  globals.nama = _controller.text;
                  _nama = globals.nama;
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Selamat datang $_nama'),
                    ),
                  );
                  var duration = const Duration(seconds: 2);
                  return Timer(
                    duration,
                    () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Survey()),
                      );
                    },
                  );
                }
              },
              child: Text(
                'Submit',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                // style: textStyle.copyWith(
                //     color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: <Widget>[
      //   ],
      //   centerTitle: true,
      //   title: Text(
      //     'Login',
      //     style: TextStyle(
      //         fontSize: 20.0,
      //         fontWeight: FontWeight.normal,
      //         fontStyle: FontStyle.normal),
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: Center(
        child: MyCustomForm(),
      ),
    );
  }
}
