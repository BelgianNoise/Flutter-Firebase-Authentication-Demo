import 'package:flutter/material.dart';
import 'package:no/common/theme/breakpoints.dart';
import 'package:no/common/theme/measures.dart';
import 'package:no/common/widgets/primary-button.dart';
import 'package:no/common/widgets/secondary-button.dart';

class AJSignInAndUpButtonBar extends StatelessWidget {

  const AJSignInAndUpButtonBar({
    this.formKey,
  });

  final GlobalKey<FormState> formKey;

  signIn() {
    this.formKey.currentState.validate();
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