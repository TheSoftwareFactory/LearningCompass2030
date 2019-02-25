import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
main() {
  group('Welcome Reducer', () {
    test('should set firstStartUp bool variable in state correctly in response to FirstStartUpDoneAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.firstStartUp, isTrue);

      store.dispatch(FirstStartUpDoneAction());

      expect(store.state.firstStartUp, isFalse);
    });

    test('should set firstStartUp bool variable in state correctly in response to multiple FirstStartUpDoneActions', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      expect(store.state.firstStartUp, isTrue);

      store.dispatch(FirstStartUpDoneAction());

      expect(store.state.firstStartUp, isFalse);

      store.dispatch(FirstStartUpDoneAction());

      expect(store.state.firstStartUp, isFalse);

      store.dispatch(FirstStartUpDoneAction());

      expect(store.state.firstStartUp, isFalse);
    });
  });
}