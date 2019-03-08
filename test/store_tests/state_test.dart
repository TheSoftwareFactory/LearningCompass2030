import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

import 'package:learning_compass_exp/data/models/construct_progress_state.dart';
import 'package:learning_compass_exp/data/models/chapter_state.dart';

import '../mock_data.dart';

main() {
  group('AppState', () {
    test('has correct initial state', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(MOCK_STATIC_JSON),
      );

      expect(store.state.progress[PetalName.workLifeBalance], ConstructProgressState(id: 1, constructProgress: {1: ChapterState(id: 1, maxProgress: 10)}));
      expect(store.state.progress[PetalName.income], ConstructProgressState(id: 10, constructProgress: {1: ChapterState(id: 1, maxProgress: 10)}));
    });

    test('has null values by default', () {
      AppState defaultAppState = AppState();

      expect(defaultAppState.progress, null);
      expect(defaultAppState.flowerSmall, null);
      expect(defaultAppState.firstStartUp, null);
    });

    group('has an overriden hashCode method', () {
      test("that produces a correct value", () {
        AppState initialState = AppState.initial(MOCK_STATIC_JSON);

        int expectedHash = initialState.flowerSmall.hashCode ^
            initialState.progress.hashCode ^
            initialState.subroute.hashCode ^
            initialState.firstStartUp.hashCode;

        expect(initialState.hashCode, expectedHash);
      });
    });

    group('has an overriden operator== method', () {
      test("that produces correct results", () {
        Map<PetalName, ConstructProgressState> firstMap = {PetalName.environment: ConstructProgressState(id: 1, constructProgress: {3: ChapterState(id: 45, maxProgress: 56, read: true, foundWords: ['asdf'])})};
        Map<PetalName, ConstructProgressState> secondMap = {PetalName.environment: ConstructProgressState(id: 1, constructProgress: {3: ChapterState(id: 45, maxProgress: 56, read: true, foundWords: ['asdf'])})};

        AppState firstAppState =
            AppState(flowerSmall: false, progress: firstMap);
        AppState secondAppState =
            AppState(flowerSmall: false, progress: secondMap);

        expect(firstAppState == secondAppState, isTrue);
      });
    });

    group('has a copyWith method', () {
      test('that copies the AppState its called on correctly', () {
        AppState originalAppState = AppState.initial(MOCK_STATIC_JSON);
        AppState copiedAppState = originalAppState.copyWith();

        expect(identical(copiedAppState, originalAppState), false);
        expect(copiedAppState == originalAppState, true);
      });

      test("that copies the AppState except for given parameter", () {
        AppState originalAppState = AppState.initial(MOCK_STATIC_JSON);
        AppState modifiedAppState =
            originalAppState.copyWith(flowerSmall: false);

        expect(modifiedAppState != originalAppState, isTrue);
        expect(modifiedAppState.progress == originalAppState.progress, isTrue);
        expect(originalAppState.flowerSmall, isTrue);
        expect(modifiedAppState.flowerSmall, isFalse);
      });
    });

    group('has a fromJson method', () {
      test('that returns null if given a null json parameter', () {
        expect(AppState.fromJson(null, MOCK_STATIC_JSON), null);
      });

      test(
          'that returns null if given a non-empty parameter but without progress property',
          () {
        dynamic testInput = {'something': 123, 'here': "too"};

        expect(AppState.fromJson(testInput, MOCK_STATIC_JSON), null);
      });

      test(
          'that returns AppState initial state when parameter proper petals is  empty',
          () {
        dynamic testInput = {'progress': {}};

        expect(AppState.fromJson(testInput, MOCK_STATIC_JSON),
            AppState.initial(MOCK_STATIC_JSON)); // REMOVE IF WORKS
      });

      test(
          'that returns a new, modified initial state that has the json values provided',
          () {
        dynamic testInput = {
          'progress': {
            PetalName.education.toString(): ConstructProgressState(id: 7, constructProgress: {1: ChapterState(id: 1, read: true, foundWords: ['asdf'])}).toJson(),
            PetalName.civicEngagement.toString(): ConstructProgressState(id: 5, constructProgress: {1: ChapterState(id: 1, read: false, foundWords: ['asdf'])}).toJson(),
          },
          'firstStartUp': false,
        };

        AppState expectedAppState = AppState.initial(MOCK_STATIC_JSON);
        expectedAppState.progress[PetalName.education] = ConstructProgressState(id: 7, constructProgress: {1: ChapterState(id: 1, maxProgress: 10, read: true, foundWords: ['asdf'])});
        expectedAppState.progress[PetalName.civicEngagement] = ConstructProgressState(id: 5, constructProgress: {1: ChapterState(id: 1, maxProgress: 10, read: false, foundWords: ['asdf'])});
        expectedAppState = expectedAppState.copyWith(firstStartUp: false);

        expect(AppState.fromJson(testInput, MOCK_STATIC_JSON), equals(expectedAppState));
      });

      test('that returns new default initial state when given an empty Map',
          () {
        dynamic testInput = {'progress': {}};

        expect(AppState.fromJson(testInput, MOCK_STATIC_JSON), AppState.initial(MOCK_STATIC_JSON));
      });

      test(
          'that returns the default initial state if given a parameter with invalid names',
          () {
        dynamic testInput = {
          'progress': {'invalidName': 56, 'anotherInvalidName': 100}
        };

        expect(AppState.fromJson(testInput, MOCK_STATIC_JSON), AppState.initial(MOCK_STATIC_JSON));
      });
    });

    group('has a toJson method', () {
      test('that returns the relevant state values when state is initial', () {
        AppState initialState = AppState.initial(MOCK_STATIC_JSON);
        dynamic expectedOutput = {
          'progress': {
            'PetalName.workLifeBalance': ConstructProgressState(id: 1, constructProgress: {1: ChapterState(id: 1, maxProgress: 10)}),
            'PetalName.safety': ConstructProgressState(id: 2, constructProgress: {1: ChapterState(id: 1, maxProgress: 10)}),
            'PetalName.lifeSatisfaction': ConstructProgressState(id: 3, constructProgress: {1: ChapterState(id: 1, maxProgress: 10)}),
            'PetalName.health': ConstructProgressState(id: 4, constructProgress: {1: ChapterState(id: 1, maxProgress: 10)}),
            'PetalName.civicEngagement': ConstructProgressState(id: 5, constructProgress: {1: ChapterState(id: 1, maxProgress: 10)}),
            'PetalName.environment': ConstructProgressState(id: 6, constructProgress: {1: ChapterState(id: 1, maxProgress: 10)}),
            'PetalName.education': ConstructProgressState(id: 7, constructProgress: {1: ChapterState(id: 1, maxProgress: 10)}),
            'PetalName.community': ConstructProgressState(id: 8, constructProgress: {1: ChapterState(id: 1, maxProgress: 10)}),
            'PetalName.jobs': ConstructProgressState(id: 9, constructProgress: {1: ChapterState(id: 1, maxProgress: 10)}),
            'PetalName.income': ConstructProgressState(id: 10, constructProgress: {1: ChapterState(id: 1, maxProgress: 10)}),
            'PetalName.housing': ConstructProgressState(id: 11, constructProgress: {1: ChapterState(id: 1, maxProgress: 10)})
          },
          'firstStartUp': true,
        };

        expect(initialState.toJson(), expectedOutput);
      });
    });
  });
}
