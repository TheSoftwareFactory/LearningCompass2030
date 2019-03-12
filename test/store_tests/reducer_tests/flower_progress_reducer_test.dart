import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

import '../../mock_data.dart';

main() {
  group('Flower Progress Reducer', () {
    test(
        'should set read status bool variable in state correctly in response to SetChapterAsReadAction',
        () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(MOCK_STATIC_JSON),
      );

      expect(store.state.progress[PetalName.safety].constructProgress[1].read,
          isFalse);
      expect(
          store.state.progress[PetalName.civicEngagement].constructProgress[1]
              .read,
          isFalse);

      store.dispatch(SetChapterAsReadAction(PetalName.safety, 1));

      expect(store.state.progress[PetalName.safety].constructProgress[1].read,
          isTrue);
      expect(
          store.state.progress[PetalName.civicEngagement].constructProgress[1]
              .read,
          isFalse);
    });

    test(
        'should set read bool variable in state correctly in response to multiple SetChapterAsReadAction',
        () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(MOCK_STATIC_JSON),
      );

      expect(
          store.state.progress[PetalName.civicEngagement].constructProgress[1]
              .read,
          isFalse);

      store.dispatch(SetChapterAsReadAction(PetalName.civicEngagement, 1));

      expect(
          store.state.progress[PetalName.civicEngagement].constructProgress[1]
              .read,
          isTrue);

      store.dispatch(SetChapterAsReadAction(PetalName.civicEngagement, 1));

      expect(
          store.state.progress[PetalName.civicEngagement].constructProgress[1]
              .read,
          isTrue);

      store.dispatch(SetChapterAsReadAction(PetalName.civicEngagement, 1));

      expect(
          store.state.progress[PetalName.civicEngagement].constructProgress[1]
              .read,
          isTrue);
    });

    test('should add correct found magic word to the correct chapter of the correct construct in the state in response to WordFoundAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(MOCK_STATIC_JSON),
      );

      expect(store.state.progress[PetalName.education].constructProgress[1].foundWords, []);

      store.dispatch(WordFoundAction(PetalName.education, 1, 'amazement'));

      expect(store.state.progress[PetalName.education].constructProgress[1].foundWords, ['amazement']);
    });

    test('should not add word as found if it is found previously in response to WordFoundAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(MOCK_STATIC_JSON),
      );

      expect(store.state.progress[PetalName.education].constructProgress[1].foundWords, []);

      store.dispatch(WordFoundAction(PetalName.education, 1, 'amazement'));
      store.dispatch(WordFoundAction(PetalName.education, 1, 'amazement'));

      expect(store.state.progress[PetalName.education].constructProgress[1].foundWords, ['amazement']);
    });

    test('should add multiple different words as found in response to WordFoundAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(MOCK_STATIC_JSON),
      );

      expect(store.state.progress[PetalName.education].constructProgress[1].foundWords, []);

      store.dispatch(WordFoundAction(PetalName.education, 1, 'amazement'));
      store.dispatch(WordFoundAction(PetalName.education, 1, 'balls'));

      expect(store.state.progress[PetalName.education].constructProgress[1].foundWords, ['amazement', 'balls']);
    });
  });
}
