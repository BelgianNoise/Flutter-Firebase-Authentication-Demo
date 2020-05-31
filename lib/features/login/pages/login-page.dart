import 'package:flutter/material.dart';
import 'package:no/common/theme/measures.dart';
import 'package:no/common/validators/login-password.dart';
import 'package:no/common/widgets/text-form-field-email.dart';
import 'package:no/features/login/widgets/external-services-buttons.dart';
import 'package:no/features/login/widgets/login-page-template.dart';
import 'package:no/common/widgets/text-form-field.dart';
import 'package:no/features/login/widgets/login-sign-in-up-button-bar.dart';

class RALoginPage extends StatefulWidget {
  @override
  _RALoginPageState createState() => _RALoginPageState();
}

class _RALoginPageState extends State<RALoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AJTextFormFieldEmail(
                  emailController: this.emailController
                ),
                AJTextFormField(
                  labelText: 'Wachtwoord: ',
                  validator: loginPassword,
                  prefixIcon: Icons.lock_outline,
                  controller: this.passwordController,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: gutterNormal),
                    child: Text("Wachtwoord vergeten?",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/passwordreset');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: RALoginPageSignInAndUpButtonBar(
                    formKey: this._formKey,
                    scaffoldKey: this._scaffoldKey,
                    emailController: this.emailController,
                    passwordController: this.passwordController,
                  ),
                ),
              ],
            ),
          ),
          RAExternalServicesButtons(),
        ],
      ),
    );
  }
}