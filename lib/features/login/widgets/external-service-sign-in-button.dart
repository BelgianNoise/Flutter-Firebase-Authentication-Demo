import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:no/features/login/enums/sign-in-buttons.dart';

class AJExternalServiceSignInButton extends StatelessWidget {

  const AJExternalServiceSignInButton({
    this.onPressed,
    this.button
  });

  final Function onPressed;
  final signInButtons button;

  @override
  Widget build(BuildContext context) {
    switch(button){
      case signInButtons.Facebook: {
        return AJExternalServiceSignInButtonHelper(
          backgroundColor: Color(0xff3b5998),
          borderColor: Colors.white,
          iconColor: Colors.white,
          icon: FontAwesomeIcons.facebookF,
          onPressed: () {},
        );
      }
      break;

      case signInButtons.Google: {
        return AJExternalServiceSignInButtonHelper(
          backgroundColor: Colors.white,
          borderColor: Colors.red,
          iconColor: Colors.red,
          icon: FontAwesomeIcons.google,
          onPressed: () {},
        );
      }
      break;

      case(signInButtons.Email): {
        return AJExternalServiceSignInButtonHelper(
          backgroundColor: Colors.grey[800],
          iconColor: Colors.white,
          icon: FontAwesomeIcons.solidEnvelope,
          onPressed: () {},
        );
      }
      break;

      default: {
        return AJExternalServiceSignInButtonHelper(
          backgroundColor: Colors.white,
          borderColor: Colors.red,
          iconColor: Colors.red,
          icon: FontAwesomeIcons.google,
          onPressed: () {},
        );
      }
    }
  }
}

class AJExternalServiceSignInButtonHelper extends StatelessWidget {

  const AJExternalServiceSignInButtonHelper({
    this.onPressed,
    this.backgroundColor = Colors.white,
    this.borderColor,
    this.iconColor = Colors.black,
    this.icon = FontAwesomeIcons.google,
    this.iconSize = 25
  });

  final Function onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.backgroundColor,
        borderRadius: BorderRadius.all( Radius.circular(50) ),
        border: Border.all( color: this.borderColor ?? this.backgroundColor )
      ),
      child: IconButton(
        color: this.iconColor,
        icon: FaIcon( this.icon ),
        onPressed: this.onPressed,
        iconSize: this.iconSize,
      ),
    );
  }
}