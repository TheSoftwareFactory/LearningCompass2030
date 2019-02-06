import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/app.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/petal_icon_button.dart';
import 'package:learning_compass_exp/common/widgets/custom_icon_button.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("PetalIcon widget", () {
    final Store<AppState> store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
      //middleware: createStoreMiddleware(),
    );

    testWidgets("is correct color and shape", (WidgetTester tester) async {
      await setUpWidget(tester, store);

      Container cont = find
          .descendant(
              of: find.byType(PetalIconButton),
              matching: find.byType(Container))
          .evaluate()
          .first
          .widget;

      // color here will change when it is linked to state.
      expect(cont.decoration,
          BoxDecoration(color: Colors.red, shape: BoxShape.circle));
    });

    testWidgets("has child CustomIconButton with correct params",
        (WidgetTester tester) async {
      await setUpWidget(tester, store);

      CustomIconButton but = find
          .descendant(
              of: find.byType(PetalIconButton),
              matching: find.byType(CustomIconButton))
          .evaluate()
          .first
          .widget;

      expect(but.color, Colors.white);
      expect(but.icon.toString(), Icon(Icons.store).toString());
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
