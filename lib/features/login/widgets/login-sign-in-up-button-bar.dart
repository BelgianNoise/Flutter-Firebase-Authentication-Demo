import 'package:flutter/material.dart';
import 'package:no/common/services/auth-service.dart';
import 'package:no/common/services/snackbar-service.dart';
import 'package:no/common/widgets/primary-button.dart';
import 'package:no/common/widgets/secondary-button.dart';

class RALoginPageSignInAndUpButtonBar extends StatelessWidget {

  RALoginPageSignInAndUpButtonBar({
    this.formKey,
    this.emailController,
    this.passwordController,
    this.scaffoldKey
  });

  final GlobalKey<FormState> formKey;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final AuthService _authService = AuthService();
  final SnackBarService _snackbarService = SnackBarService();

  signIn() async {
    if (this.formKey.currentState.validate()) {
      this.formKey.currentState.save();
      String email = this.emailController.text.trim();
      String password = this.passwordController.text.trim();
      bool res = await this._authService.signInWithEmailAndPassword(email, password);
      if (res == null) {
        String message = 'Er is geen passend email-wachtwoord paar gevonden!';
        _snackbarService.displaySnackBar(
          scaffoldKey: scaffoldKey, text: message,
        );
      } else { 
        String message = 'succesvol ingelogd!';
        _snackbarService.displaySnackBar(
          scaffoldKey: scaffoldKey, text: message,
        );
      }
    } else { // should be redundant
      String message = 'Gelieve alle velden in te vullen';
      _snackbarService.displaySnackBar(
        scaffoldKey: scaffoldKey, text: message,
      );
    }
  }
  signUp(context) {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 400) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 47,
            child: AJSecondaryButton(
              text: 'Registreren',
              onPressed: () => signUp(context),
            ),
          ),
          Expanded( flex: 6, child: SizedBox()),
          Expanded(
            flex: 47,
            child: AJPrimaryButton(
              text: 'Aanmelden',
              onPressed: signIn,
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
              text: 'Aanmelden',
              onPressed: signIn,
            ),
          ),
          SizedBox( height: 5, ),
          SizedBox(
            width: double.infinity,
            child: AJSecondaryButton(
              text: 'Registreren',
              onPressed: () => signUp(context),
            ),
          ),
        ],
      );
    }
  }
}