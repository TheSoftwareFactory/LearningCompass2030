import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:learning_compass_exp/screens/home/widgets/flower/flower_menu.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/icon_circle.dart';
import 'package:learning_compass_exp/app.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("FlowerMenu widget", () {
    testWidgets('has an invisible button with correct (small) size initially', (WidgetTester tester) async  {
      await setUpWidget(tester);

      Finder invisibleButton = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(GestureDetector));
      expect(invisibleButton, findsOneWidget);

      Container containerInsideButton = find.descendant(of: invisibleButton, matching: find.byType(Container)).evaluate().first.widget;
      expect(containerInsideButton.constraints, BoxConstraints(maxHeight: 100 /4, minHeight: 100 / 4, maxWidth: 100 / 4, minWidth: 100 / 4));
    });

    testWidgets('does not contain IconCircle initially', (WidgetTester tester) async {
      await setUpWidget(tester);

      Finder iconCircles = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(IconCircle));

      expect(iconCircles, findsNothing);
    });

    testWidgets("expands flower upon tapping it", (WidgetTester tester) async {
      await setUpWidget(tester);

      Finder invisibleButton = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(GestureDetector));

      await tester.tap(invisibleButton);
      await tester.pumpAndSettle();

      Finder iconCircles = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(IconCircle));

      expect(iconCircles, findsOneWidget);

      Container containerInsideButton = find.descendant(of: invisibleButton, matching: find.byType(Container)).evaluate().first.widget;
      expect(containerInsideButton.constraints, BoxConstraints(maxHeight: 300 /4, minHeight: 300 / 4, maxWidth: 300 / 4, minWidth: 300 / 4));
    });

    testWidgets("removes icons when it is tapped in the middle when it is large", (WidgetTester tester) async {
      await setUpWidget(tester);

      Finder invisibleButton = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(GestureDetector)).first;

      await tester.tap(invisibleButton);
      await tester.pumpAndSettle();
      Finder iconCircles = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(IconCircle));
      expect(iconCircles, findsOneWidget);

      invisibleButton = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(GestureDetector)).first;

      await tester.tap(invisibleButton);
      await tester.pumpAndSettle();


      iconCircles = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(IconCircle));

      expect(iconCircles, findsNothing);

    });
  });


}

Future<void> setUpWidget(WidgetTester tester) async {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial().copyWith(firstStartUp: false),
    //middleware: createStoreMiddleware(),
  );
  await tester.pumpWidget(LearningCompassApp(store: store,));

  await tester.pump();
  await tester.pump();
}
