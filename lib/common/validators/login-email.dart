import 'package:email_validator/email_validator.dart';


String loginEmail(String value) {
  if (value.trim().isEmpty) {
    return 'Gelieve een email addres in te geven!';
  } else if (!EmailValidator.validate(value.trim())) {
    return 'Dit is geen geldig email addres!';
  } else {
    return null;
  }
}