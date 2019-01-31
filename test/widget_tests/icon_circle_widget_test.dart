import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/app.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/icon_circle.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/petal_icon.dart';
import 'package:learning_compass_exp/common/widgets/custom_icon_button.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("IconCircle widget", () {
    final Store<AppState> store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
      //middleware: createStoreMiddleware(),
    );

    testWidgets("has correct amount of PetalIcon children",
        (WidgetTester tester) async {
      await setUpWidget(tester, store);

      int buttonCount = find
          .descendant(
              of: find.byType(IconCircle), matching: find.byType(PetalIcon))
          .evaluate()
          .length;

      // color here will change when it is linked to state.
      expect(buttonCount, 11);
    });
  });
}

Future<void> setUpWidget(WidgetTester tester, Store store) async {
  await tester.pumpWidget(
    StoreProvider<AppState>(
      store: store,
      child: LearningCompassApp(),
    ),
  );

  await tester.pump();
  await tester.pump();
}
