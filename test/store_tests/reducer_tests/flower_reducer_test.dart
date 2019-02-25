import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

main() {
  group('Flower Progress Reducer', () {
    test('should increment a specific flower\'s progress by 1 in response to IncrementPetalProgressAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.progress[PetalName.safety], 50.0);

      store.dispatch(IncrementPetalProgressAction(PetalName.safety));

      expect(store.state.progress[PetalName.safety], 51.0);
    });

    test('should increment only given petal size in response to IncrementPetalProgressAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.progress[PetalName.lifeSatisfaction], 50.0);
      expect(store.state.progress[PetalName.housing], 50.0);

      store.dispatch(IncrementPetalProgressAction(PetalName.lifeSatisfaction));

      expect(store.state.progress[PetalName.lifeSatisfaction], 51.0);
      expect(store.state.progress[PetalName.housing], 50.0);
    });

    test('should not increment petal size to above 100 in response to IncrementPetalProgressAction', () {
      final AppState _initial = AppState.initial();
      _initial.progress[PetalName.civicEngagement] = 100;
      final store = Store<AppState>(
        appReducer,
        initialState: _initial,
      );

      expect(store.state.progress[PetalName.civicEngagement], 100.0);

      store.dispatch(IncrementPetalProgressAction(PetalName.civicEngagement));

      expect(store.state.progress[PetalName.civicEngagement], 100.0);
    });

    test('should increment petal size to 100 in response to IncrementPetalProgressAction', () {
      final AppState _initial = AppState.initial();
      _initial.progress[PetalName.civicEngagement] = 99.0;
      final store = Store<AppState>(
        appReducer,
        initialState: _initial,
      );

      expect(store.state.progress[PetalName.civicEngagement], 99.0);

      store.dispatch(IncrementPetalProgressAction(PetalName.civicEngagement));

      expect(store.state.progress[PetalName.civicEngagement], 100.0);
    });

    test('should decrement a specific flower\'s petal size by 1 in response to DecrementPetalProgressAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      store.dispatch(IncrementPetalProgressAction(PetalName.lifeSatisfaction));
      store.dispatch(IncrementPetalProgressAction(PetalName.lifeSatisfaction));
      expect(store.state.progress[PetalName.lifeSatisfaction], 52.0);

      store.dispatch(DecrementPetalProgressAction(PetalName.lifeSatisfaction));

      expect(store.state.progress[PetalName.lifeSatisfaction], 51.0);
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
      expect(store.state.progress[PetalName.lifeSatisfaction], 52.0);
      expect(store.state.progress[PetalName.housing], 52.0);

      store.dispatch(DecrementPetalProgressAction(PetalName.lifeSatisfaction));

      expect(store.state.progress[PetalName.lifeSatisfaction], 51.0);
      expect(store.state.progress[PetalName.housing], 52.0);
    });

    test('should not decrement specific flower\'s petal size if the current size is 30', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.progress[PetalName.civicEngagement], 50.0);

      store.dispatch(DecrementPetalProgressAction(PetalName.civicEngagement));

      expect(store.state.progress[PetalName.civicEngagement], 50.0);
    });

    test('should not decrement specific flower\'s petal size if the current size is less than 30', () {
      final AppState _initial = AppState.initial();
      _initial.progress[PetalName.civicEngagement] = 25.0;
      final store = Store<AppState>(
        appReducer,
        initialState: _initial,
      );

      expect(store.state.progress[PetalName.civicEngagement], 25.0);

      store.dispatch(DecrementPetalProgressAction(PetalName.civicEngagement));

      expect(store.state.progress[PetalName.civicEngagement], 25.0);
    });
  });
}