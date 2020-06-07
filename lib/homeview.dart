import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  String _nama;
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text(
            'Masukkan Nama Anda:\n',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[300]),),
          Container(
            margin: EdgeInsets.only(right: 50, left: 50),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: new BorderRadius.circular(10),
            ),
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                prefixIcon: Icon(Icons.account_circle),
                border: InputBorder.none,
                fillColor: Colors.grey,
                focusColor: Colors.grey,
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          RaisedButton(
  onPressed: () {
    // Validate returns true if the form is valid, otherwise false.
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      _nama = _controller.text;
      Scaffold
          .of(context)
          .showSnackBar(SnackBar(content: Text('Selamat datang $_nama')));
    }
  },
  child: Text('Submit'),
),

        ]));
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
      backgroundColor: Colors.cyan,
      body: Center(
        child: MyCustomForm()),
    );
  }
}
