import 'package:flutter/material.dart';
import 'package:no/common/theme/measures.dart';

class AJSecondaryButton extends StatelessWidget {

  const AJSecondaryButton({
    this.onPressed,
    this.text = 'placeholder',
  });

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      borderSide: BorderSide(
        color: Theme.of(context).primaryColorDark,
      ),
      onPressed: this.onPressed,
      child: Padding(
        padding: const EdgeInsets.all(gutterNormal),
        child: Text( 
          this.text,
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}