import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/data/models/petal.dart';

main() {
  test('Store should have correct initial state', () {
    final store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
    );

    expect(store.state.number, 80);
    expect(store.state.petals[PetalName.education], Petal(name: PetalName.education, color: Colors.red, angle: 0/ 11 * pi));
    expect(store.state.petals[PetalName.community], Petal(name: PetalName.community, color: Colors.blue, angle: 2/ 11 * pi));
    expect(store.state.petals[PetalName.job], Petal(name: PetalName.job, color: Colors.lightBlue, angle: 4/ 11 * pi));
    expect(store.state.petals[PetalName.income], Petal(name: PetalName.income, color: Colors.lightGreen, angle: 6/ 11 * pi));
    expect(store.state.petals[PetalName.housing], Petal(name: PetalName.housing, color: Colors.indigo, angle: 8/ 11 * pi));
    expect(store.state.petals[PetalName.workLifeBalance], Petal(name: PetalName.workLifeBalance, color: Colors.amber, angle: 10/ 11 * pi));
    expect(store.state.petals[PetalName.safety], Petal(name: PetalName.safety, color: Colors.blueGrey, angle: 12/ 11 * pi));
    expect(store.state.petals[PetalName.lifeSatisfaction], Petal(name: PetalName.lifeSatisfaction, color: Colors.deepOrange, angle: 14/ 11 * pi));
    expect(store.state.petals[PetalName.health], Petal(name: PetalName.health, color: Colors.lime, angle: 16/ 11 * pi));
    expect(store.state.petals[PetalName.civicEngagement], Petal(name: PetalName.civicEngagement, color: Colors.purple, angle: 18/ 11 * pi));
    expect(store.state.petals[PetalName.environment], Petal(name: PetalName.environment, color: Colors.green, angle: 20/ 11 * pi));
  });

  test('AppState has null values by default', () {
    AppState defaultAppState = AppState();

    expect(defaultAppState.petals, null);
    expect(defaultAppState.number, null);
  });

  test("AppState has an overriden hashCode function that produces a correct value", () {
    AppState initialState = AppState.initial();

    int expectedHash = initialState.number.hashCode ^ initialState.petals.hashCode;

    expect(initialState.hashCode, expectedHash);
  });

  test("AppState has an overriden operator == that produces correct results", () {
    Map<PetalName, Petal> firstMap = {PetalName.environment: Petal(name: PetalName.lifeSatisfaction, progress: 67, angle: 78)};
    Map<PetalName, Petal> secondMap = {PetalName.environment: Petal(name: PetalName.lifeSatisfaction, progress: 67, angle: 78)};
    AppState firstAppState = AppState(number: 56, petals: firstMap);
    AppState secondAppState = AppState(number: 56, petals: secondMap);

    expect(firstAppState == secondAppState, true);
  });

  test('AppState has a copyWith function that copies the AppState its called on correctly', () {
    AppState originalAppState = AppState.initial();
    AppState copiedAppState = originalAppState.copyWith();

    expect(identical(copiedAppState, originalAppState), false);
    expect(copiedAppState == originalAppState, true);
  });

  test("AppState has copyWith function that copies the AppState except for given parameter", () {
    AppState originalAppState = AppState.initial();
    AppState modifiedAppState = originalAppState.copyWith(number: 69);

    expect(modifiedAppState != originalAppState, true);
    expect(isMapEqual(modifiedAppState.petals, originalAppState.petals), true);
    expect(originalAppState.number, 80);
    expect(modifiedAppState.number, 69);
  });


}