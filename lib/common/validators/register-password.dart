String registerPassword(String value) {
  if ( value.trim().length < 8 ) {
    return 'Kies een wachtwoord van minstens 8 tekens!';
  }
  return null;
}