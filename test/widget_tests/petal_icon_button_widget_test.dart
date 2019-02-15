import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/app.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/petal_icon_button.dart';
import 'package:learning_compass_exp/common/widgets/custom_icon_button.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/common/widgets/custom_icons_icons.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("PetalIconButton widget", () {

    testWidgets("is correct color and shape", (WidgetTester tester) async {
      await setUpWidget(tester);

      Container cont = find
          .descendant(
              of: find.byType(PetalIconButton),
              matching: find.byType(Container))
          .evaluate()
          .first
          .widget;

      expect(cont.decoration,
          BoxDecoration(color: Colors.red[900], shape: BoxShape.circle));
    });

    testWidgets("creates an icon button with given parameters",
        (WidgetTester tester) async {
      Color expectedColor = Colors.blue;
      IconData expectedIcon = CustomIcons.education;

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: PetalIconButton(
        color: expectedColor,
        icon: expectedIcon,
      ))));

      await tester.pump();
      await tester.pump();

      Container container = find
          .descendant(
              of: find.byType(PetalIconButton),
              matching: find.byType(Container))
          .evaluate()
          .first
          .widget;

      BoxDecoration decoration = container.decoration;

      CustomIconButton iconButton = find
          .descendant(
              of: find.byType(PetalIconButton),
              matching: find.byType(CustomIconButton))
          .evaluate()
          .first
          .widget;

      expect(decoration.color, expectedColor);
      expect(iconButton.icon.toString(), Icon(expectedIcon).toString());
    });

    testWidgets("has child CustomIconButton with correct params",
        (WidgetTester tester) async {
      await setUpWidget(tester);

      CustomIconButton but = find
          .descendant(
              of: find.byType(PetalIconButton),
              matching: find.byType(CustomIconButton))
          .evaluate()
          .first
          .widget;

      expect(but.color, Colors.white);
      expect(but.icon.toString(), Icon(CustomIcons.workLifeBalance).toString());
    });
  });
}

Future<void> setUpWidget(WidgetTester tester) async {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial().copyWith(flowerSmall: false),
    //middleware: createStoreMiddleware(),
  );

  await tester.pumpWidget(LearningCompassApp(store: store,));

  await tester.pump();
  await tester.pump();
}
