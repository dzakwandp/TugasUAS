import 'package:Halo_Halo/services/services.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  int _persentage = 0;

  ProfilePage(this._persentage);

  @override
  _ProfilePageState createState() => _ProfilePageState(_persentage);
}

class _ProfilePageState extends State<ProfilePage> {
  TextStyle _textStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  FirebaseAuths _firebaseAuths = FirebaseAuths();
  int _persentage = 0;
  String _photoUrl = '';
  String _username = '';

  _ProfilePageState(this._persentage);

  void getUserInfo() async {
    _firebaseAuths.getCurrentUser().then(
      (value) {
        setState(
          () {
            _photoUrl = value.photoUrl.toString();
            _username = value.displayName.toString();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    final photoProfile = Padding(
      padding: EdgeInsets.all(16.0),
      child: CircleAvatar(
        radius: 72.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(_photoUrl),
      ),
    );

    final userProfile = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        _username,
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final description = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Persentase anda untuk terjangkit COVID-19 adalah $_persentage%, selalu jaga kesehatan dengan memakai masker, sering-sering mencuci tangan, gunakan hand sanitizer, dan jaga jarak minimal 1.5 meter, terimakasih semoga sehat selalu,.....',
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );

    final signOut = Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            _firebaseAuths.signOut().then(
                  (value) => Navigator.pushNamed(context, '/loginPage'),
                );
          },
          child: Text(
            'Sign out',
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: _textStyle.copyWith(
                color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(28.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlue]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              photoProfile,
              userProfile,
              description,
              signOut,
            ],
          ),
        ),
      ),
    );
  }
}
