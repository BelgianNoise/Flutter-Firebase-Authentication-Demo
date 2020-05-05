String registerUsername(String value) {
  if ( value.trim().isEmpty ) {
    return 'Gelieve een gebruikersnaam in te geven!';
  }
  if ( value.trim().length < 2 ) {
    return 'Een gebruikersnaam moet minstens 2 letters lang zijn';
  }
  return null;
}