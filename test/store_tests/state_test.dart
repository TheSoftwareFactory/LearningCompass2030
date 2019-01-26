import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

main() {
  test('Store should have correct initial state', () {
    final store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
    );

    expect(store.state.number, 80);
    expect(store.state.flowerProgress[PetalName.civicEngagement], 30.0);
    expect(store.state.flowerProgress[PetalName.housing], 30.0);
    expect(store.state.flowerProgress[PetalName.lifeSatisfaction], 30.0);
    expect(store.state.flowerProgress[PetalName.safety], 30.0);
    expect(store.state.flowerProgress[PetalName.health], 30.0);
    expect(store.state.flowerProgress[PetalName.environment], 30.0);
    expect(store.state.flowerProgress[PetalName.workLifeBalance], 30.0);
    expect(store.state.flowerProgress[PetalName.community], 30.0);
    expect(store.state.flowerProgress[PetalName.job], 30.0);
    expect(store.state.flowerProgress[PetalName.education], 30.0);
    expect(store.state.flowerProgress[PetalName.income], 30.0);
  });
}