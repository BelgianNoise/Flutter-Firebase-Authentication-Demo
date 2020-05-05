String loginEmail(String value) {
  if (value.trim().isEmpty) {
    return 'Gelieve een email addres in te geven!';
  } else if (!new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(value.trim())) {
    return 'Dit is geen geldig email addres!';
  } else {
    return null;
  }
}