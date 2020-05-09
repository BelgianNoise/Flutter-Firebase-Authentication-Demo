import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no/features/login/widgets/external-service-sign-in-button.dart';
import 'package:no/features/login/enums/sign-in-buttons.dart';

class RAExternalServicesButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        SizedBox( height: 5 ),
        Text('Of log in via een van deze serivces'),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            AJExternalServiceSignInButton(
              button: signInButtons.Facebook,
              onPressed: () {},
            ),
            AJExternalServiceSignInButton(
              button: signInButtons.Google,
              onPressed: () {},
            ),
            AJExternalServiceSignInButton(
              button: signInButtons.Email,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}