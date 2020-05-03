String loginPassword(String value) {
  return value.trim().isEmpty ? 'Gelieve een wachtwoord in te geven!' : null;
}