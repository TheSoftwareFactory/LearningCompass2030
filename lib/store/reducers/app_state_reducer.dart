import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/number_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    //expItems: expItemsReducer(state.expItems, action),
    //listState: listStateReducer(state.listState, action),
    number: numberReducer(state.number, action),
  );
}