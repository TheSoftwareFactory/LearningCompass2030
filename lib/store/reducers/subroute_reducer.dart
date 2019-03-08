import 'package:redux/redux.dart';

import 'package:learning_compass_exp/store/actions/actions.dart';

final subrouteReducer = combineReducers<String>([
  TypedReducer<String, ChangeSubrouteAction>(_changeSubroute),
]);

String _changeSubroute(String currentRoute, ChangeSubrouteAction action) {
  return action.subroute;
}