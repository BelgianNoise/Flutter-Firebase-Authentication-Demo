import 'dart:async';
import 'package:flutter/material.dart';
import 'package:no/common/services/auth-service.dart';
import 'package:no/common/services/snackbar-service.dart';
import 'package:no/common/widgets/primary-button.dart';
import 'package:no/common/widgets/secondary-button.dart';

class RAPasswordResetButtons extends StatelessWidget {

  RAPasswordResetButtons({
    this.formKey,
    this.emailController,
    this.scaffoldKey
  });

  final GlobalKey<FormState> formKey;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final TextEditingController emailController;

  final AuthService _authService = AuthService();
  final SnackBarService _snackbarService = SnackBarService();

  resetPassword(context) async {
    if (this.formKey.currentState.validate()) {
      this.formKey.currentState.save();
      String email = this.emailController.text.trim();
      bool res = await this._authService.passwordReset(email);
      if (res == null) {
        String message = 'Er is geen account met dit email addres!';
        _snackbarService.displaySnackBar(
          scaffoldKey: scaffoldKey, text: message,
        );
      } else { 
        String message = 'Check je inbox! Er werd een email verzonden met een link om je wachtwoord opnieuw in te stellen.';
        _snackbarService.displaySnackBar(
          scaffoldKey: scaffoldKey, text: message,
        );
        new Timer(const Duration(seconds: 5), () => Navigator.pop(context) );
      }
    } else { // should be redundant
      String message = 'Gelieve een email addres in te vullen';
      _snackbarService.displaySnackBar(
        scaffoldKey: scaffoldKey, text: message,
      );
    }
  }
  back(context) {
    Navigator.pop(context);
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
              text: 'Ga terug',
              onPressed: () => back(context),
            ),
          ),
          Expanded( flex: 6, child: SizedBox()),
          Expanded(
            flex: 47,
            child: AJPrimaryButton(
              text: 'Wachtwoord resetten',
              onPressed: () => resetPassword(context),
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
              text: 'Wachtwoord resetten',
              onPressed: () => resetPassword(context),
            ),
          ),
          SizedBox( height: 5, ),
          SizedBox(
            width: double.infinity,
            child: AJSecondaryButton(
              text: 'Ga terug',
              onPressed: () => back(context),
            ),
          ),
        ],
      );
    }
  }
}