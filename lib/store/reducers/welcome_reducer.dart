import 'package:redux/redux.dart';

import 'package:learning_compass_exp/store/actions/actions.dart';

final welcomeReducer = combineReducers<bool>([
  TypedReducer<bool, FirstStartUpDoneAction>(_firstStartUpDone),
]);

bool _firstStartUpDone(bool firstStartUpDone, FirstStartUpDoneAction action) {
  return false;
}

