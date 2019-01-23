import 'package:redux/redux.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';

final numberReducer = combineReducers<int>([
  TypedReducer<int, IncrementNumberAction>(_incrementNumber),
  TypedReducer<int, DecrementNumberAction>(_decrementNumber),
  TypedReducer<int, SetNumberAction>(_setNumber),
]);

int _incrementNumber(int number, IncrementNumberAction action) {
  return number += 1;
}

int _decrementNumber(int number, DecrementNumberAction action) {
  return number -= 1;
}

int _setNumber(int number, SetNumberAction action) {
  return action.number;
}
