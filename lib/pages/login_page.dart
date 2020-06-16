import 'package:flutter/material.dart';
import 'package:Halo_Halo/services/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle _textStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  GoogleAuths _googleAuth = GoogleAuths();
  FacebookAuths _facebookAuth = FacebookAuths();

  @override
  Widget build(BuildContext context) {
    final signInWithGoogle = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.grey,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _googleAuth.signInWithGoogle().then(
                (value) => Navigator.pushNamed(context, '/surveyPage'),
              );
        },
        child: Text(
          'Sign in with google',
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: _textStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final signInWithFacebook = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _facebookAuth
              .signInWithFacebook()
              .then((value) => Navigator.pushNamed(context, '/surveyPage'));
        },
        child: Text(
          'Sign in with facebook',
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: _textStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      'images/splash.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 45.0),
                  signInWithGoogle,
                  SizedBox(height: 15.0),
                  signInWithFacebook,
                  SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
