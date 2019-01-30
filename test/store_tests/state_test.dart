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
    expect(store.state.flowerProgress[PetalName.civicEngagement], 50.0);
    expect(store.state.flowerProgress[PetalName.housing], 50.0);
    expect(store.state.flowerProgress[PetalName.lifeSatisfaction], 50.0);
    expect(store.state.flowerProgress[PetalName.safety], 50.0);
    expect(store.state.flowerProgress[PetalName.health], 50.0);
    expect(store.state.flowerProgress[PetalName.environment], 50.0);
    expect(store.state.flowerProgress[PetalName.workLifeBalance], 50.0);
    expect(store.state.flowerProgress[PetalName.community], 50.0);
    expect(store.state.flowerProgress[PetalName.job], 50.0);
    expect(store.state.flowerProgress[PetalName.education], 50.0);
    expect(store.state.flowerProgress[PetalName.income], 50.0);
  });
}