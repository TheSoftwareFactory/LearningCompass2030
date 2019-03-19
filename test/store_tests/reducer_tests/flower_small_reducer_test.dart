import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';

import '../../mock_data.dart';

main() {
  group('Flower Small Reducer', () {
    test('should set flowerSmall bool variable in state correctly in response to FirstStartUpDoneAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(MOCK_STATIC_JSON),
      );

      expect(store.state.flowerSmall, isFalse);

      store.dispatch(ToggleFlowerSmallAction());

      expect(store.state.flowerSmall, isTrue);
    });

    test('should toggle flowerSmall bool variable in state correctly in response to multiple ToggleFlowerSmallAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(MOCK_STATIC_JSON),
      );

      expect(store.state.flowerSmall, isFalse);

      store.dispatch(ToggleFlowerSmallAction());

      expect(store.state.flowerSmall, isTrue);

      store.dispatch(ToggleFlowerSmallAction());

      expect(store.state.flowerSmall, isFalse);

      store.dispatch(ToggleFlowerSmallAction());

      expect(store.state.flowerSmall, isTrue);
    });
  });
}