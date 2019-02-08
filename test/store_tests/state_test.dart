import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/common/widgets/custom_icons_icons.dart';

main() {
  test('Store should have correct initial state', () {
    final store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
    );

    expect(store.state.number, 80);
    expect(store.state.petals[PetalName.workLifeBalance], Petal(name: PetalName.workLifeBalance, color: Colors.red[900], angle: 0.0, icon: CustomIcons.workLifeBalance));
    expect(store.state.petals[PetalName.safety], Petal(name: PetalName.safety, color: Colors.blueGrey, angle: 2 / 11 * pi, icon: CustomIcons.safety));
    expect(store.state.petals[PetalName.lifeSatisfaction], Petal(name: PetalName.lifeSatisfaction, color: Colors.orange[600], angle: 4 / 11 * pi, icon: CustomIcons.lifeSatisfaction));
    expect(store.state.petals[PetalName.health], Petal(name: PetalName.health, color: Colors.purple, angle: 6 / 11 * pi, icon: CustomIcons.health));
    expect(store.state.petals[PetalName.civicEngagement], Petal(name: PetalName.civicEngagement, color: Colors.amber, angle: 8/ 11 * pi, icon: CustomIcons.civicEngagement));
    expect(store.state.petals[PetalName.environment], Petal(name: PetalName.environment, color: Colors.green, angle: 10 / 11 * pi, icon: CustomIcons.environment));
    expect(store.state.petals[PetalName.education], Petal(name: PetalName.education, color: Colors.lightGreen[400], angle: 12 / 11 * pi, icon: CustomIcons.education));
    expect(store.state.petals[PetalName.community], Petal(name: PetalName.community, color: Colors.red[400], angle: 14 / 11 * pi, icon: CustomIcons.community));
    expect(store.state.petals[PetalName.job], Petal(name: PetalName.job, color: Colors.blue, angle: 16 / 11 * pi, icon: CustomIcons.jobs));
    expect(store.state.petals[PetalName.income], Petal(name: PetalName.income, color: Colors.cyan, angle: 18 / 11 * pi, icon: CustomIcons.income));
    expect(store.state.petals[PetalName.housing], Petal(name: PetalName.housing, color: Colors.teal[300], angle: 20 / 11 * pi, icon: CustomIcons.housing));

  });
}