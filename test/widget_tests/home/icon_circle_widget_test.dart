import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/app.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/petal_icon_button.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/icon_circle.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/common/widgets/custom_icons_icons.dart';

import '../../mock_data.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("IconCircle widget", () {
    testWidgets("has correct amount of PetalIcon children",
        (WidgetTester tester) async {
      await setUpWidget(tester);

      expect(find.byType(IconCircle), findsOneWidget);
      int buttonCount = find
          .descendant(
              of: find.byType(IconCircle), matching: find.byType(PetalIconButton))
          .evaluate()
          .length;

      expect(buttonCount, 11);
    });

    testWidgets("has 11 icons with correct parameters", (WidgetTester tester) async {
      await setUpWidget(tester);

      List expectedValues = [
        { 'color': Colors.red[900], 'icon': CustomIcons.workLifeBalance },
        { 'color': Colors.blueGrey, 'icon': CustomIcons.safety },
        { 'color': Colors.orange[400], 'icon': CustomIcons.lifeSatisfaction },
        { 'color': Colors.purple, 'icon': CustomIcons.health },
        { 'color': Colors.amber, 'icon': CustomIcons.civicEngagement },
        { 'color': Colors.green, 'icon': CustomIcons.environment },
        { 'color': Colors.lightGreen[400], 'icon': CustomIcons.education },
        { 'color': Colors.red[400], 'icon': CustomIcons.community },
        { 'color': Colors.blue, 'icon': CustomIcons.jobs },
        { 'color': Colors.cyan, 'icon': CustomIcons.income },
        { 'color': Colors.teal[300], 'icon': CustomIcons.housing },
      ];

      Iterable buttons = find.byType(PetalIconButton).evaluate();
      PetalIconButton iconButton;

      for (int i = 0; i < 1; i++) {
        iconButton = buttons.elementAt(0).widget;
        final expected = expectedValues[i];
        expect(iconButton.petal.color, expected['color']);
        expect(iconButton.petal.icon, expected['icon']);
      }
    });
  });
}

Future<void> setUpWidget(WidgetTester tester) async {
  // Sets state to correspond to flower being large and icons showing.
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(MOCK_STATIC_JSON).copyWith(flowerSmall: false),
    //middleware: createStoreMiddleware(),
  );

  await tester.pumpWidget(LearningCompassApp(store: store,));

  await tester.pump();
  await tester.pump();
}
