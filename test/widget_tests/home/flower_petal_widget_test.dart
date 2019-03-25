import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/common/widgets/flower/flower_petal.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';

import '../../mock_data.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("FlowerPetal widget", () {
    testWidgets("has the correct angle for the petal",
        (WidgetTester tester) async {
      await setUpWidget(tester);

      Transform transform = find.byType(Transform).evaluate().first.widget;

      expect(transform.transform, Matrix4.rotationZ(6.9));
    });
  });
}

Future<void> setUpWidget(WidgetTester tester) async {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(MOCK_STATIC_JSON),
    //middleware: createStoreMiddleware(),
  );

  await tester.pumpWidget(
    StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: FlowerPetal(
            angle: 6.9,
            color: Colors.red,
            progress: 69.6,
          ),
        ),
    ),
  );

  await tester.pump();
  await tester.pump();
}
