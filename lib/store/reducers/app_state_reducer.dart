import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/number_reducer.dart';
import 'package:learning_compass_exp/store/reducers/flower_petal_reducer.dart';
import 'package:learning_compass_exp/store/reducers/flower_small_reducer.dart';
import 'package:learning_compass_exp/store/reducers/subroute_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    number: numberReducer(state.number, action),
    petals: flowerPetalReducer(state.petals, action),
    flowerSmall: flowerSmallReducer(state.flowerSmall, action),
    subroute: subrouteReducer(state.subroute, action),
  );
}