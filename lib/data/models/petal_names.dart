enum PetalName {
  workLifeBalance,
  safety,
  lifeSatisfaction,
  health,
  civicEngagement,
  environment,
  education,
  community,
  job,
  income,
  housing
}

// Finds the equivalent PetalName value for the given string. If bad string given, returns null.
// Expects the string to be in the form of PetalName.valueHere.toString().
PetalName petalNameFromString(String petalAsString) {
  if (!PetalName.values.any((name) => name.toString() == petalAsString)) return null;
  return PetalName.values.firstWhere((name) => name.toString() == petalAsString);
}
