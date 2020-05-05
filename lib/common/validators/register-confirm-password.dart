String registerConfirmPassword(String value, String password) {
  if ( value.trim().isEmpty ) {
    if ( password.trim().isEmpty ) {
      return 'Kies een wachtwoord van minstens 8 tekens!';
    } else {
      return 'De 2 wachtwoorden komen niet overeen!';
    }
  }
  if ( value.trim() != password.trim() ) {
    return 'De 2 wachtwoorden komen niet overeen!';
  }
  return null;
}