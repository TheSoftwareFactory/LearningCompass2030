import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/flower_progress_reducer.dart';
import 'package:learning_compass_exp/store/reducers/flower_small_reducer.dart';
import 'package:learning_compass_exp/store/reducers/welcome_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    progress: flowerProgressReducer(state.progress, action),
    flowerSmall: flowerSmallReducer(state.flowerSmall, action),
    firstStartUp: welcomeReducer(state.firstStartUp, action),
  );
}