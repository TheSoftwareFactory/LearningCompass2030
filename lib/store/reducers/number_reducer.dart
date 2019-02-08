import 'package:redux/redux.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';

final numberReducer = combineReducers<int>([
  TypedReducer<int, IncrementNumberAction>(_incrementNumber),
]);

int _incrementNumber(int number, IncrementNumberAction action) {
  return number += 1;
}
