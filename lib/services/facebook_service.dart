import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookAuths {
  final FacebookLogin _facebookLogin = FacebookLogin();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signInWithFacebook() async {
    final facebookLoginResult = await _facebookLogin.logIn(['email']);
    final token = facebookLoginResult.accessToken.token;

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        // onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        // onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        final AuthCredential credential =
            FacebookAuthProvider.getCredential(accessToken: token);
        final FirebaseUser user = ( await _firebaseAuth.signInWithCredential(credential)).user;
        print(user.displayName);
        return user;
        // print("LoggedIn");
        // onLoginStatusChanged(true);
        break;
    }
  }
}
