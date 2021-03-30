import 'package:aahaar/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  var isGoogle = false;
  User currentUser;
  AuthMethods({this.currentUser}) {
    googleSignIn.signInSilently();
  }
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);
  Users _userfirebse(User user) {
    if (user == null) {
      return null;
    } else {
      currentUser = user;
      return Users(user: user);
    }
  }

  Future signUpwithEmail(String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => _userfirebse(value.user));
      //return _userfirebse(result.user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signInwithEmail({String email, String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => _userfirebse(value.user));
    } catch (e) {
      print(e.toString());
    }
  }

  Future<GoogleSignInAccount> _handleSignIn() async {
    GoogleSignInAccount googleuser;
    try {
      googleuser = await googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
    return googleuser;
  }

  Future<User> signInwithGoogle(BuildContext ctx) async {
    GoogleSignInAccount googleuser = await _handleSignIn();
    UserCredential authresult;
    if (googleuser != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleuser.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      authresult = await auth.signInWithCredential(authCredential);
    } else {
      print("user not there ............");
    }
    return authresult.user;
  }

  Future signout() async {
    try {
      if (isGoogle) {
        return await googleSignIn.signOut();
      } else
        return await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  // ignore: missing_return
  Future resetPassword({String email}) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
