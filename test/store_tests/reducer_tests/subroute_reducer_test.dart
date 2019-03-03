import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';

import '../../mock_data.dart';

main() {
  group('Subroute Reducer', () {
    test('should set subroute String variable in state correctly in response to ChangeSubrouteAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(MOCK_STATIC_JSON),
      );

      expect(store.state.subroute, isNull);

      store.dispatch(ChangeSubrouteAction('thththis'));

      expect(store.state.subroute, 'thththis');
    });

    test('should set subroute String variable in state correctly in response to multiple ChangeSubrouteAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(MOCK_STATIC_JSON),
      );

      expect(store.state.subroute, isNull);

      store.dispatch(ChangeSubrouteAction('one thing'));

      expect(store.state.subroute, 'one thing');

      store.dispatch(ChangeSubrouteAction('another thing'));

      expect(store.state.subroute, 'another thing');
    });
  });
}