import 'package:flutter/material.dart';
import 'package:no/common/services/auth-service.dart';
import 'package:no/common/services/snackbar-service.dart';
import 'package:no/common/widgets/primary-button.dart';
import 'package:no/common/widgets/secondary-button.dart';

class RARegisterPageSignInAndUpButtonBar extends StatelessWidget {

  RARegisterPageSignInAndUpButtonBar({
    this.formKey,
    this.scaffoldKey,
    this.emailController,
    this.passwordController,
    this.usernameController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;

  final GlobalKey<FormState> formKey;
  final GlobalKey<ScaffoldState> scaffoldKey;

  final AuthService _authService = AuthService();
  final SnackBarService _snackbarService = SnackBarService();

  signUp(context) async {
    if ( this.formKey.currentState.validate() ) {
      this.formKey.currentState.save();
      String email = this.emailController.text.trim();
      String username = this.usernameController.text.trim();
      String password = this.passwordController.text.trim();
      bool res = await _authService.registerWithEmailAndPassword(email, username, password);
      if ( res == true ) {
        String message = 'Je account werd succesvol aangemaakt!';
        _snackbarService.displaySnackBar(
          scaffoldKey: scaffoldKey, text: message,
        );
        Navigator.pop(context);
      } else if ( res == false ) {
        String message = 'Het email addres is niet geldig of is reeds in gebruik!';
        _snackbarService.displaySnackBar(
          scaffoldKey: scaffoldKey, text: message,
        );
      } else { // res == null
        String message = 'Er ging iets mis bij het aanmaken van je account, probeer het later nog eens of contacteer een administrator!';
        _snackbarService.displaySnackBar(
          scaffoldKey: scaffoldKey, text: message,
        );
      }
    } else {
      String message = 'Gelieve alle velden in te vullen';
      _snackbarService.displaySnackBar(
        scaffoldKey: scaffoldKey, text: message,
      );
    }
  }

  signIn(context) {
    Navigator.pop(context);
  }
  
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 400) {
      return Row(
        children: <Widget>[
          Expanded(
            flex: 47,
            child: AJSecondaryButton(
              text: 'Al een account ?',
              onPressed: () => signIn(context),
            ),
          ),
          Expanded( flex: 6, child: SizedBox()),
          Expanded(
            flex: 47,
            child: AJPrimaryButton(
              text: 'Account maken',
              onPressed: () => signUp(context),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: AJPrimaryButton(
              text: 'Account maken',
              onPressed: () => signUp(context),
            ),
          ),
          SizedBox( height: 5, ),
          SizedBox(
            width: double.infinity,
            child: AJSecondaryButton(
              text: 'Al een account ?',
              onPressed: () => signIn(context),
            ),
          ),
        ],
      );
    }
  }
}