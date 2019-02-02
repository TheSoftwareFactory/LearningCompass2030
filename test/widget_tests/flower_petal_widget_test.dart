import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower_petal.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("FlowerPetal widget", () {
    final Store<AppState> store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
      //middleware: createStoreMiddleware(),
    );

    testWidgets("sets petal size correctly initially",
        (WidgetTester tester) async {
      await setUpWidget(tester, store);

      Container cont = find.byType(Container).evaluate().first.widget;

      expect(
          cont.constraints,
          BoxConstraints.expand(
              width: (69.6 / 100) * (500 - 30),
              height: (69.6 / 100) * (500 - 30)));
    });

    testWidgets("has the correct angle for the petal",
        (WidgetTester tester) async {
      await setUpWidget(tester, store);

      Transform transform = find.byType(Transform).evaluate().first.widget;

      expect(transform.transform, Matrix4.rotationZ(6.9));
    });
  });
}

Future<void> setUpWidget(WidgetTester tester, Store store) async {
  await tester.pumpWidget(
    StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: FlowerPetal(
          maxPetalSize: 500,
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
