import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try{
      print('Logging in with email: ' + email + ' and password: ' + password);
      AuthResult res = await _auth.signInWithEmailAndPassword(email: email, password: password);
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

  Future<bool> registerWithEmailAndPassword(String email, String username, String pass) async {
    try {
      print('Registering...');
      await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      await changeUsername(username, pass);
      print('Account registered succesfully!');
      return true;
    } catch (error) {
      print('An error occured while registering account: ' + error.toString() );
      if ( error.toString().contains('email address is already in use') ) {
        return false;
      }
      return null;
    }
  }

  Future<bool> changeUsername(String newUsername, String pass) async {
    try {
      print('Changing username...');
      var user = await _auth.currentUser();
      UserUpdateInfo info = new UserUpdateInfo();
      info.displayName = newUsername;
      await user.updateProfile(info);
      await user.reload();
      // needed to trigger provider
      await signOut();
      await signInWithEmailAndPassword(user.email, pass);
      print('Username changed succesfully!');
      return true;
    } catch (error) {
      print('An error occured while changing username: ' + error.toString() );
      return null;
    }
  }

  Future<bool> passwordReset(String email) async {
    try {
      print('Requesting password reset...');
      await _auth.sendPasswordResetEmail(email: email);
      print('Password reset email has been requested / sent!');
      return true;
    } catch (error) {
      print('An error occured while requesting password reset: ' + error.toString() );
      return null;
    }
  }
}