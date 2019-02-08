import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/app.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/petal_icon_button.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/icon_circle.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/flower_menu.dart';

import 'dart:io';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("IconCircle widget", () {
    final Store<AppState> store = Store<AppState>(
      appReducer,
      initialState: AppState.initial().copyWith(flowerSmall: false),
      //middleware: createStoreMiddleware(),
    );

    testWidgets("has correct amount of PetalIcon children",
        (WidgetTester tester) async {
      await setUpWidget(tester, store);

      expect(find.byType(IconCircle), findsOneWidget);
      int buttonCount = find
          .descendant(
              of: find.byType(IconCircle), matching: find.byType(PetalIconButton))
          .evaluate()
          .length;

      expect(buttonCount, 11);
    });
  });
}

Future<void> setUpWidget(WidgetTester tester, Store store) async {
  await tester.pumpWidget(
    LearningCompassApp(testingStore: store,)
  );

  await tester.pump();
  await tester.pump();
}
