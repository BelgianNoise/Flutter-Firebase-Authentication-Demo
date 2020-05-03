import 'package:flutter/material.dart';
import 'package:no/common/theme/measures.dart';

class AJTextFormField extends StatelessWidget {

  const AJTextFormField({
    this.validator,
    this.labelText,
    this.maxLines = 1,
    this.paddingTop = gutterNormal,
    this.paddingBotttom = gutterNormal,
    this.paddingLeft = 0,
    this.paddingRight = 0,
    this.prefixIcon,
    this.textInputType = TextInputType.text,
    this.controller,
    this.obscureText = false,
  });

  final Function validator;
  final String labelText;
  final int maxLines;
  final double paddingTop;
  final double paddingBotttom;
  final double paddingLeft;
  final double paddingRight;
  final IconData prefixIcon;
  final TextInputType textInputType;
  final controller;
  final obscureText;

  final OutlineInputBorder errorOutlineBorder = const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent)
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        paddingLeft, paddingTop, paddingRight, paddingBotttom
      ),
      child: TextFormField(
        obscureText: this.obscureText,
        controller: this.controller,
        maxLines: this.maxLines,
        validator: (val) => this.validator(val),
        cursorColor: Theme.of(context).primaryColorDark,
        decoration: InputDecoration(
          prefixIcon: this.prefixIcon != null ? Icon( this.prefixIcon ) : null,
          labelText: this.labelText,
          labelStyle: TextStyle( color: Theme.of(context).primaryColorDark),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColorDark)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor)
          ),
          errorBorder: errorOutlineBorder,
          focusedErrorBorder: errorOutlineBorder,
        ),
        keyboardType: this.textInputType,
      ),
    );
  }
}