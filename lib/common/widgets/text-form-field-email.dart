import 'package:flutter/material.dart';
import 'package:no/common/validators/login-email.dart';
import 'package:no/common/widgets/text-form-field.dart';

class AJTextFormFieldEmail extends StatelessWidget {
  const AJTextFormFieldEmail({
    this.emailController,
    this.showIcon = true
  });
  
  final emailController;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return AJTextFormField(
      labelText: 'Email: ',
      validator: loginEmail,
      prefixIcon: this.showIcon ? Icons.person_outline : null,
      controller: this.emailController,
      textInputType: TextInputType.emailAddress,
    );
  }
}