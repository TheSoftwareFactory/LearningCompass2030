import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

main() {
  group('Flower Reducer', () {
    test('should set petal size correctly in response to an SetPetalSizeAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.flowerProgress[PetalName.education], 30.0);

      store.dispatch(SetPetalSizeAction(69.0, PetalName.education));

      expect(store.state.flowerProgress[PetalName.education], 69.0);
    });

    test('should only set correct petal size and leave other petals untouched in response to SetPetalSizeAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.flowerProgress[PetalName.education], 30.0);
      expect(store.state.flowerProgress[PetalName.health], 30.0);

      store.dispatch(SetPetalSizeAction(69.0, PetalName.education));

      expect(store.state.flowerProgress[PetalName.health], 30.0);
      expect(store.state.flowerProgress[PetalName.education], 69.0);
    });

    test('should increment a specific flower\'s progress by 1 in response to IncrementPetalProgressAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.flowerProgress[PetalName.safety], 30.0);

      store.dispatch(IncrementPetalProgressAction(PetalName.safety));

      expect(store.state.flowerProgress[PetalName.safety], 31.0);
    });

    test('should increment only given petal size in response to IncrementPetalProgressAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.flowerProgress[PetalName.lifeSatisfaction], 30.0);
      expect(store.state.flowerProgress[PetalName.housing], 30.0);

      store.dispatch(IncrementPetalProgressAction(PetalName.lifeSatisfaction));

      expect(store.state.flowerProgress[PetalName.lifeSatisfaction], 31.0);
      expect(store.state.flowerProgress[PetalName.housing], 30.0);
    });

    test('should decrement a specific flower\'s petal size by 1 in response to DecrementPetalProgressAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      store.dispatch(IncrementPetalProgressAction(PetalName.lifeSatisfaction));
      store.dispatch(IncrementPetalProgressAction(PetalName.lifeSatisfaction));
      expect(store.state.flowerProgress[PetalName.lifeSatisfaction], 32.0);

      store.dispatch(DecrementPetalProgressAction(PetalName.lifeSatisfaction));

      expect(store.state.flowerProgress[PetalName.lifeSatisfaction], 31.0);
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
      expect(store.state.flowerProgress[PetalName.lifeSatisfaction], 32.0);
      expect(store.state.flowerProgress[PetalName.housing], 32.0);

      store.dispatch(DecrementPetalProgressAction(PetalName.lifeSatisfaction));

      expect(store.state.flowerProgress[PetalName.lifeSatisfaction], 31.0);
      expect(store.state.flowerProgress[PetalName.housing], 32.0);
    });

    test('should not decrement specific flower\'s petal size if the current size is 30', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.flowerProgress[PetalName.civicEngagement], 30.0);

      store.dispatch(DecrementPetalProgressAction(PetalName.civicEngagement));

      expect(store.state.flowerProgress[PetalName.civicEngagement], 30.0);
    });

    test('should not decrement specific flower\'s petal size if the current size is less than 30', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial()..flowerProgress[PetalName.civicEngagement] = 25.0,
      );

      expect(store.state.flowerProgress[PetalName.civicEngagement], 25.0);

      store.dispatch(DecrementPetalProgressAction(PetalName.civicEngagement));

      expect(store.state.flowerProgress[PetalName.civicEngagement], 25.0);
    });
  });
}