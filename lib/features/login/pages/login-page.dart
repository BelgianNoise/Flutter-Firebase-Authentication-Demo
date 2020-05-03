import 'package:flutter/material.dart';
import 'package:no/features/login/enums/sign-in-buttons.dart';
import 'package:no/common/theme/measures.dart';
import 'package:no/common/validators/login-password.dart';
import 'package:no/common/validators/login-email.dart';
import 'package:no/features/login/widgets/sign-in-button.dart';
import 'package:no/common/widgets/text-form-field.dart';
import 'package:no/features/login/widgets/sign-in-up-button-bar.dart';

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
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/loginBackground.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(gutterLarge),
          child: Container(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration( color: Color(0xF5FFFFFF) ),
              constraints: BoxConstraints(
                maxWidth: 500,
              ),
              child: Padding(
                padding: const EdgeInsets.all(gutterLarge),
                child: SingleChildScrollView(
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
                            AJTextFormField(
                              labelText: 'Email: ',
                              validator: loginEmail,
                              prefixIcon: Icons.person_outline,
                              controller: this.emailController,
                              textInputType: TextInputType.emailAddress,
                            ),
                            AJTextFormField(
                              labelText: 'Wachtwoord: ',
                              validator: loginPassword,
                              prefixIcon: Icons.lock_outline,
                              controller: this.passwordController,
                              textInputType: TextInputType.visiblePassword,
                              obscureText: true,
                            ),
                            AJSignInAndUpButtonBar(
                              formKey: this._formKey,
                              scaffoldKey: this._scaffoldKey,
                              emailController: this.emailController,
                              passwordController: this.passwordController,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox( height: 5 ),
                      Text('Of log in via een van deze serivces'),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AJSignInButton(
                            button: signInButtons.Facebook,
                            onPressed: () {},
                          ),
                          AJSignInButton(
                            button: signInButtons.Google,
                            onPressed: () {},
                          ),
                          AJSignInButton(
                            button: signInButtons.Email,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}