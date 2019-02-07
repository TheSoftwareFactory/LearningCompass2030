import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/data/models/petal.dart';

main() {
  group('Flower Reducer', () {
    test('should set petal size correctly in response to an SetPetalSizeAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.petals[PetalName.education].progress, 50.0);

      store.dispatch(SetPetalSizeAction(69.0, PetalName.education));

      expect(store.state.petals[PetalName.education].progress, 69.0);
    });

    test('should only set correct petal size and leave other petals untouched in response to SetPetalSizeAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.petals[PetalName.education].progress, 50.0);
      expect(store.state.petals[PetalName.health].progress, 50.0);

      store.dispatch(SetPetalSizeAction(69.0, PetalName.education));

      expect(store.state.petals[PetalName.health].progress, 50.0);
      expect(store.state.petals[PetalName.education].progress, 69.0);
    });

    test('should increment a specific flower\'s progress by 1 in response to IncrementPetalProgressAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.petals[PetalName.safety].progress, 50.0);

      store.dispatch(IncrementPetalProgressAction(PetalName.safety));

      expect(store.state.petals[PetalName.safety].progress, 51.0);
    });

    test('should increment only given petal size in response to IncrementPetalProgressAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.petals[PetalName.lifeSatisfaction].progress, 50.0);
      expect(store.state.petals[PetalName.housing].progress, 50.0);

      store.dispatch(IncrementPetalProgressAction(PetalName.lifeSatisfaction));

      expect(store.state.petals[PetalName.lifeSatisfaction].progress, 51.0);
      expect(store.state.petals[PetalName.housing].progress, 50.0);
    });

    test('should not increment petal size to above 100 in response to IncrementPetalProgressAction', () {
      final Petal _fullPetal = Petal(name: PetalName.civicEngagement, progress: 100.0);
      final AppState _initial = AppState.initial();
      _initial.petals[PetalName.civicEngagement] = _fullPetal;
      final store = Store<AppState>(
        appReducer,
        initialState: _initial,
      );

      expect(store.state.petals[PetalName.civicEngagement].progress, 100.0);

      store.dispatch(IncrementPetalProgressAction(PetalName.civicEngagement));

      expect(store.state.petals[PetalName.civicEngagement].progress, 100.0);
    });

    test('should increment petal size to 100 in response to IncrementPetalProgressAction', () {
      final Petal _fullPetal = Petal(name: PetalName.civicEngagement, progress: 99.0);
      final AppState _initial = AppState.initial();
      _initial.petals[PetalName.civicEngagement] = _fullPetal;
      final store = Store<AppState>(
        appReducer,
        initialState: _initial,
      );

      expect(store.state.petals[PetalName.civicEngagement].progress, 99.0);

      store.dispatch(IncrementPetalProgressAction(PetalName.civicEngagement));

      expect(store.state.petals[PetalName.civicEngagement].progress, 100.0);
    });

    test('should decrement a specific flower\'s petal size by 1 in response to DecrementPetalProgressAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      store.dispatch(IncrementPetalProgressAction(PetalName.lifeSatisfaction));
      store.dispatch(IncrementPetalProgressAction(PetalName.lifeSatisfaction));
      expect(store.state.petals[PetalName.lifeSatisfaction].progress, 52.0);

      store.dispatch(DecrementPetalProgressAction(PetalName.lifeSatisfaction));

      expect(store.state.petals[PetalName.lifeSatisfaction].progress, 51.0);
    });

    test('should decrement only given petal size in response to DecrementPetalProgressAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      store.dispatch(IncrementPetalProgressAction(PetalName.lifeSatisfaction));
      store.dispatch(IncrementPetalProgressAction(PetalName.lifeSatisfaction));
      store.dispatch(IncrementPetalProgressAction(PetalName.housing));
      store.dispatch(IncrementPetalProgressAction(PetalName.housing));
      expect(store.state.petals[PetalName.lifeSatisfaction].progress, 52.0);
      expect(store.state.petals[PetalName.housing].progress, 52.0);

      store.dispatch(DecrementPetalProgressAction(PetalName.lifeSatisfaction));

      expect(store.state.petals[PetalName.lifeSatisfaction].progress, 51.0);
      expect(store.state.petals[PetalName.housing].progress, 52.0);
    });

    test('should not decrement specific flower\'s petal size if the current size is 30', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.petals[PetalName.civicEngagement].progress, 50.0);

      store.dispatch(DecrementPetalProgressAction(PetalName.civicEngagement));

      expect(store.state.petals[PetalName.civicEngagement].progress, 50.0);
    });

    test('should not decrement specific flower\'s petal size if the current size is less than 30', () {
      final Petal _fullPetal = Petal(name: PetalName.civicEngagement, progress: 25.0);
      final AppState _initial = AppState.initial();
      _initial.petals[PetalName.civicEngagement] = _fullPetal;
      final store = Store<AppState>(
        appReducer,
        initialState: _initial,
      );

      expect(store.state.petals[PetalName.civicEngagement].progress, 25.0);

      store.dispatch(DecrementPetalProgressAction(PetalName.civicEngagement));

      expect(store.state.petals[PetalName.civicEngagement].progress, 25.0);
    });
  });
}