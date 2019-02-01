import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/number_reducer.dart';
import 'package:learning_compass_exp/store/reducers/flower_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    number: numberReducer(state.number, action),
    flowerProgress: flowerReducer(state.flowerProgress, action),
  );
}