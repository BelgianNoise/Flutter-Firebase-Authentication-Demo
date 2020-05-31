import 'package:flutter/material.dart';
import 'package:no/common/theme/measures.dart';
import 'package:no/common/widgets/text-form-field-email.dart';
import 'package:no/features/login/widgets/login-page-template.dart';
import 'package:no/features/login/widgets/password-reset-buttons.dart';

class RAPasswordResetPage extends StatelessWidget {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RALoginPageTemplate(
      scaffoldKey: _scaffoldKey,
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                Text('Wachtwoord opnieuw instellen',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox( height: gutterNormal, ),
                AJTextFormFieldEmail(
                  emailController: this.emailController,
                  showIcon: false,
                ),
                RAPasswordResetButtons(
                  formKey: this._formKey,
                  scaffoldKey: this._scaffoldKey,
                  emailController: this.emailController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}