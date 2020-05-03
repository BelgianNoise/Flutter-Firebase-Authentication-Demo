import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;

  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try{
      print('Logging in with email: ' + email + ' and password: ' + password);
      AuthResult res = await _auth.signInWithEmailAndPassword(email: email, password: password);
      this._user = res.user;
      print('Succesfully logged in: ' + res.user.toString());
      return true;
    } catch (error) {
      print('Error occured while logging in with email and password:' + error.toString());
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      print('Signing out...');
      await _auth.signOut();
      print('Signed out, redirecting to login screen...');
      return true;
    } catch (error) {
      print('An error occured while signing out: ' + error.toString() );
      return null;
    }
  }
}