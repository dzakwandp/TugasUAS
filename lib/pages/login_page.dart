import 'package:Halo_Halo/pages/survey.dart';
import 'package:flutter/material.dart';
import 'package:Halo_Halo/services/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle textStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  Auth auth = Auth();

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
          auth.googleSignIn().whenComplete(
                () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Survey();
                    },
                  ),
                ),
              );
        },
        child: Text(
          'Sign in with google',
          textAlign: TextAlign.center,
          style: textStyle.copyWith(
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
        onPressed: () {},
        child: Text(
          'Sign in with facebook',
          textAlign: TextAlign.center,
          style: textStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
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
    );
  }

  Widget _googleSignInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        auth.googleSignIn().whenComplete(
              () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return Survey();
                  },
                ),
              ),
            );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('images/google_logo.png'),
              height: 35.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Sign in with google',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
