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

// This assumes parameter is given in the form that the built in toString() method gives.
// For example, PetalName.education
PetalName petalNameFromString(String petalAsString) {
  return PetalName.values.firstWhere((name) => name.toString() == petalAsString);
}
