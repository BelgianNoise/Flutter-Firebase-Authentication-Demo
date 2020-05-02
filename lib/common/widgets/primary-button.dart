import 'package:flutter/material.dart';
import 'package:no/common/theme/measures.dart';

class AJPrimaryButton extends StatelessWidget {
  
  const AJPrimaryButton({
    this.onPressed,
    this.text = 'placeholder',
  });

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColorDark,
      onPressed: this.onPressed,
      child: Padding(
        padding: const EdgeInsets.all(gutterNormal),
        child: Text( 
          this.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}