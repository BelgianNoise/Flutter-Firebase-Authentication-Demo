import 'package:flutter/material.dart';
import 'package:no/common/services/auth-service.dart';
import 'package:no/common/services/snackbar-service.dart';
import 'package:no/common/theme/breakpoints.dart';
import 'package:no/common/theme/measures.dart';
import 'package:no/common/widgets/primary-button.dart';
import 'package:no/common/widgets/secondary-button.dart';

class AJSignInAndUpButtonBar extends StatelessWidget {

  AJSignInAndUpButtonBar({
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
  signUp() {

  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > phoneBreakPoint) {
      return ButtonBar(
        alignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          AJSecondaryButton(
            text: 'Registreren',
            onPressed: signUp,
          ),
          AJPrimaryButton(
            text: 'Aanmelden',
            onPressed: signIn,
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(gutterNormal),
            child: AJPrimaryButton(
              text: 'Aanmelden',
              onPressed: signIn,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(gutterNormal),
            child: AJSecondaryButton(
              text: 'Registreren',
              onPressed: signUp,
            ),
          ),
        ],
      );
    }
    
  }
}