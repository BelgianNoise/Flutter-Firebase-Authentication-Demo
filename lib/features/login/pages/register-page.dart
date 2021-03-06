import 'package:flutter/material.dart';
import 'package:no/common/validators/register-confirm-password.dart';
import 'package:no/common/validators/register-password.dart';
import 'package:no/common/validators/register-username.dart';
import 'package:no/common/widgets/text-form-field-email.dart';
import 'package:no/common/widgets/text-form-field.dart';
import 'package:no/features/login/widgets/external-services-buttons.dart';
import 'package:no/features/login/widgets/login-page-template.dart';
import 'package:no/features/login/widgets/register-sign-in-up-button-bar.dart';

class RARegisterPage extends StatelessWidget {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return RALoginPageTemplate(
      scaffoldKey: _scaffoldKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AJTextFormFieldEmail(
                  emailController: this.emailController,
                  showIcon: false,
                ),
                AJTextFormField(
                  labelText: 'Gebruikersnaam: ',
                  validator: registerUsername,
                  controller: this.usernameController,
                ),
                AJTextFormField(
                  labelText: 'Wachtwoord: ',
                  validator: registerPassword,
                  controller: passwordController,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                AJTextFormField(
                  labelText: 'Bevestig wachtwoord: ',
                  validator: (value) => registerConfirmPassword(value, passwordController.value.text),
                  controller: confirmpasswordController,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                Text('Een hoofdletter, cijfer en/of speciaal teken ' +
                    'in je wachtwoord zijn niet verplicht maar wel sterk aangeraden.',
                    style: TextStyle( color: Colors.grey[600], fontSize: 11, ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: RARegisterPageSignInAndUpButtonBar(
                    formKey: this._formKey,
                    scaffoldKey: this._scaffoldKey,
                    emailController: this.emailController,
                    usernameController: this.usernameController,
                    passwordController: this.passwordController,
                  ),
                ),
              ],
            ),
          ),
          RAExternalServicesButtons(),
        ],
      )
    );
  }
}