import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

main() {
  group('AppState', () {
    test('has correct initial state', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.progress[PetalName.workLifeBalance], 50);
      expect(store.state.progress[PetalName.safety], 50);
      expect(store.state.progress[PetalName.lifeSatisfaction], 50);
      expect(store.state.progress[PetalName.health], 50);
      expect(store.state.progress[PetalName.civicEngagement], 50);
      expect(store.state.progress[PetalName.environment], 50);
      expect(store.state.progress[PetalName.education], 50);
      expect(store.state.progress[PetalName.community], 50);
      expect(store.state.progress[PetalName.job], 50);
      expect(store.state.progress[PetalName.income], 50);
      expect(store.state.progress[PetalName.housing], 50);
    });

    test('has null values by default', () {
      AppState defaultAppState = AppState();

      expect(defaultAppState.progress, null);
      expect(defaultAppState.flowerSmall, null);
      expect(defaultAppState.firstStartUp, null);
    });
    
    group('has an overriden hashCode method', () {
      test("that produces a correct value", () {
        AppState initialState = AppState.initial();

        int expectedHash =
            initialState.flowerSmall.hashCode ^ 
            initialState.progress.hashCode ^
            initialState.firstStartUp.hashCode;
        
        expect(initialState.hashCode, expectedHash);
      });
    });

    group('has an overriden operator== method', () {
      test("that produces correct results", () {
        Map<PetalName, double> firstMap = {PetalName.environment: 56};
        Map<PetalName, double> secondMap = {PetalName.environment: 56};
        AppState firstAppState =
            AppState(flowerSmall: false, progress: firstMap);
        AppState secondAppState =
            AppState(flowerSmall: false, progress: secondMap);

        expect(firstAppState == secondAppState, isTrue);
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
        AppState modifiedAppState =
            originalAppState.copyWith(flowerSmall: false);

        expect(modifiedAppState != originalAppState, isTrue);
        expect(isMapEqual(modifiedAppState.progress, originalAppState.progress),
            isTrue);
        expect(originalAppState.flowerSmall, isTrue);
        expect(modifiedAppState.flowerSmall, isFalse);
      });
    });

    group('has a fromJson method', () {
      test('that returns null if given a null json parameter', () {
        expect(AppState.fromJson(null), null);
      });

      test('that returns null if given a non-empty parameter but without progress property',
          () {
        dynamic testInput = {'something': 123, 'here': "too"};

        expect(AppState.fromJson(testInput), null);
      });

      test(
          'that returns AppState initial state when parameter proper petals is  empty',
          () {
        dynamic testInput = {'progress': {}};

        expect(AppState.fromJson(testInput),
            AppState.initial()); // REMOVE IF WORKS
      });

      test(
          'that returns a new, modified initial state that has the json values provided',
          () {
        dynamic testInput = {
          'progress': {
            PetalName.education.toString(): 56.0,
            PetalName.civicEngagement.toString(): 100.0
          },
          'firstStartUp': false
        };

        AppState expectedAppState = AppState.initial();
        expectedAppState.progress[PetalName.education] = 56.0;
        expectedAppState.progress[PetalName.civicEngagement] = 100.0;
        expectedAppState = expectedAppState.copyWith(firstStartUp: false);

        expect(AppState.fromJson(testInput), equals(expectedAppState));
      });

      test('that returns new default initial state when given an empty Map',
          () {
        dynamic testInput = {'progress': {}};

        expect(AppState.fromJson(testInput), AppState.initial());
      });

      test('that returns the default initial state if given a parameter with invalid names',
          () {
        dynamic testInput = {
          'progress': {'invalidName': 56, 'anotherInvalidName': 100}
        };

        expect(AppState.fromJson(testInput), AppState.initial());
      });
    });

    group('has a toJson method', () {
      test('that returns the relevant state values when state is initial', () {
        AppState initialState = AppState.initial();
        dynamic expectedOutput = {
          'progress': {
            'PetalName.workLifeBalance': 50.0,
            'PetalName.safety': 50.0,
            'PetalName.lifeSatisfaction': 50.0,
            'PetalName.health': 50.0,
            'PetalName.civicEngagement': 50.0,
            'PetalName.environment': 50.0,
            'PetalName.education': 50.0,
            'PetalName.community': 50.0,
            'PetalName.job': 50.0,
            'PetalName.income': 50.0,
            'PetalName.housing': 50.0
          },
          'firstStartUp': true,
        };

        expect(initialState.toJson(), expectedOutput);
      });
    });
  });
}
