import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/common/widgets/custom_icons_icons.dart';

main() {
  group('AppState', () {
    test('has correct initial state', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.number, 80);
      expect(
          store.state.petals[PetalName.workLifeBalance],
          Petal(
              name: PetalName.workLifeBalance,
              color: Colors.red[900],
              angle: 0.0,
              icon: CustomIcons.workLifeBalance));
      expect(
          store.state.petals[PetalName.safety],
          Petal(
              name: PetalName.safety,
              color: Colors.blueGrey,
              angle: 2 / 11 * pi,
              icon: CustomIcons.safety));
      expect(
          store.state.petals[PetalName.lifeSatisfaction],
          Petal(
              name: PetalName.lifeSatisfaction,
              color: Colors.orange[600],
              angle: 4 / 11 * pi,
              icon: CustomIcons.lifeSatisfaction));
      expect(
          store.state.petals[PetalName.health],
          Petal(
              name: PetalName.health,
              color: Colors.purple,
              angle: 6 / 11 * pi,
              icon: CustomIcons.health));
      expect(
          store.state.petals[PetalName.civicEngagement],
          Petal(
              name: PetalName.civicEngagement,
              color: Colors.amber,
              angle: 8 / 11 * pi,
              icon: CustomIcons.civicEngagement));
      expect(
          store.state.petals[PetalName.environment],
          Petal(
              name: PetalName.environment,
              color: Colors.green,
              angle: 10 / 11 * pi,
              icon: CustomIcons.environment));
      expect(
          store.state.petals[PetalName.education],
          Petal(
              name: PetalName.education,
              color: Colors.lightGreen[400],
              angle: 12 / 11 * pi,
              icon: CustomIcons.education));
      expect(
          store.state.petals[PetalName.community],
          Petal(
              name: PetalName.community,
              color: Colors.red[400],
              angle: 14 / 11 * pi,
              icon: CustomIcons.community));
      expect(
          store.state.petals[PetalName.job],
          Petal(
              name: PetalName.job,
              color: Colors.blue,
              angle: 16 / 11 * pi,
              icon: CustomIcons.jobs));
      expect(
          store.state.petals[PetalName.income],
          Petal(
              name: PetalName.income,
              color: Colors.cyan,
              angle: 18 / 11 * pi,
              icon: CustomIcons.income));
      expect(
          store.state.petals[PetalName.housing],
          Petal(
              name: PetalName.housing,
              color: Colors.teal[300],
              angle: 20 / 11 * pi,
              icon: CustomIcons.housing));
    });

    test('has null values by default', () {
      AppState defaultAppState = AppState();

      expect(defaultAppState.petals, null);
      expect(defaultAppState.flowerSmall, null);
      expect(defaultAppState.firstStartUp, null);
      expect(defaultAppState.number, null);
    });
    group('has an overriden hashCode method', () {
      test("that produces a correct value", () {
        AppState initialState = AppState.initial();

        int expectedHash = initialState.number.hashCode ^
            initialState.flowerSmall.hashCode ^
            initialState.firstStartUp.hashCode ^
            initialState.petals.hashCode;

        expect(initialState.hashCode, expectedHash);
      });
    });

    group('has an overriden operator== method', () {
      test("that produces correct results", () {
        Map<PetalName, Petal> firstMap = {
          PetalName.environment:
              Petal(name: PetalName.lifeSatisfaction, progress: 67, angle: 78)
        };
        Map<PetalName, Petal> secondMap = {
          PetalName.environment:
              Petal(name: PetalName.lifeSatisfaction, progress: 67, angle: 78)
        };
        AppState firstAppState = AppState(number: 56, petals: firstMap);
        AppState secondAppState = AppState(number: 56, petals: secondMap);

        expect(firstAppState == secondAppState, true);
      });
    });

    group('has a copyWith method', () {
      test('that copies the AppState its called on correctly', () {
        AppState originalAppState = AppState.initial();
        AppState copiedAppState = originalAppState.copyWith();

        expect(identical(copiedAppState, originalAppState), false);
        expect(copiedAppState == originalAppState, true);
      });

      test("that copies the AppState except for given parameter", () {
        AppState originalAppState = AppState.initial();
        AppState modifiedAppState = originalAppState.copyWith(number: 69);

        expect(modifiedAppState != originalAppState, true);
        expect(
            isMapEqual(modifiedAppState.petals, originalAppState.petals), true);
        expect(originalAppState.number, 80);
        expect(modifiedAppState.number, 69);
      });
    });

    group('has a fromJson method', () {
      test('that returns null if given a null json parameter', () {
        expect(AppState.fromJson(null), null);
      });

      test(
          'that returns null if given a non-empty parameter but without petals property',
          () {
        dynamic testInput = {'something': 123, 'here': "too"};

        expect(AppState.fromJson(testInput), null);
      });

      test(
          'that returns AppState initial state when parameter proper petals is  empty',
          () {
        dynamic testInput = {'petals': {}};

        expect(AppState.fromJson(testInput), null);
      });

      test(
          'that returns a new, modified initial state that has the json values provided',
          () {
        dynamic testInput = {
          'petals': [
            {'name': PetalName.education.toString(), 'progress': 56},
            {'name': PetalName.civicEngagement.toString(), 'progress': 100}
          ],
          'firstStartUp': false
        };

        AppState expectedAppState = AppState.initial();
        expectedAppState.petals[PetalName.education] =
            expectedAppState.petals[PetalName.education].copyWith(progress: 56);
        expectedAppState.petals[PetalName.civicEngagement] = expectedAppState
            .petals[PetalName.civicEngagement]
            .copyWith(progress: 100);
        expectedAppState = expectedAppState.copyWith(firstStartUp: false);

        expect(AppState.fromJson(testInput), equals(expectedAppState));
      });

      test(
          'that returns new default initial state when given an empty iterable',
          () {
        dynamic testInput = {'petals': []};

        expect(AppState.fromJson(testInput), AppState.initial());
      });

      test(
          'that returns the default initial state if given a parameter with no names',
          () {
        dynamic testInput = {
          'petals': [
            {'progress': 56},
            {'progress': 100}
          ]
        };

        expect(AppState.fromJson(testInput), AppState.initial());
      });

      test(
          'that returns the default initial state if given a parameter with no progress property',
          () {
        dynamic testInput = {
          'petals': [
            {'name': PetalName.education.toString()},
            {'name': PetalName.civicEngagement.toString()}
          ]
        };

        expect(AppState.fromJson(testInput), AppState.initial());
      });
    });

    group('has a toJson method', () {
      test('that returns the relevant state values when state is initial', () {
        AppState initialState = AppState.initial();
        dynamic expectedOutput = {
          'firstStartUp': true,
          'petals': initialState.petals.values.toList()
        };

        // The redux_persist library serializer handles converting each item in the
        // list into a JSON object.
        expect(initialState.toJson(), expectedOutput);
      });
    });
  });
}
