import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:math';

import 'package:learning_compass_exp/screens/home/widgets/flower/flower_menu.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/icon_circle.dart';
import 'package:learning_compass_exp/app.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/flower_petal.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("FlowerMenu widget", () {
    final Store<AppState> store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
      //middleware: createStoreMiddleware(),
    );

    testWidgets("sets size correctly around the flower",
        (WidgetTester tester) async {
      await setUpWidget(tester, store);

      await tester.pump();
      await tester.pump();

      // Find first container inside flower (ie. immediate child)
      Container cont = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(Container)).evaluate().first.widget;
      FlowerMenu flower = find.byType(FlowerMenu).evaluate().first.widget;


      // Check that it's padding property is set correctly
      expect(
          cont.constraints,
          BoxConstraints.expand(
              width: flower.flowerSize, height: flower.flowerSize));
    });

    testWidgets("sets insets correctly around the flower to center it",
        (WidgetTester tester) async {
      await setUpWidget(tester, store);

      Container cont = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(Container)).evaluate().elementAt(1).widget;
      FlowerMenu flower = find.byType(FlowerMenu).evaluate().first.widget;

      // width and height in a Container translate into BoxConstraints
      expect(
          cont.padding,
          EdgeInsets.only(left: flower.flowerSize / 2, top: flower.flowerSize / 2));
    });

    testWidgets("has a Stack widget", (WidgetTester tester) async {
      await setUpWidget(tester, store);

      Container cont = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(Container)).evaluate().elementAt(1).widget;

      expect(cont.child.runtimeType, Stack);
    });

    testWidgets("contains 11 petals", (WidgetTester tester) async {
      await setUpWidget(tester, store);

      expect(find.byType(FlowerPetal).evaluate().length, 11);
    });

    testWidgets("assigns correct parameters to Flower Petals",
        (WidgetTester tester) async {
      await setUpWidget(tester, store);

      var petals = find.byType(FlowerPetal).evaluate();
      FlowerMenu flower = find.byType(FlowerMenu).evaluate().first.widget;

      FlowerPetal petal;

      // Might wanna separate into several tests. I left it like this to not
      // have to generate the widget 11 times.
      petal = petals.elementAt(0).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, 0.0);
      expect(petal.color, Colors.red);

      petal = petals.elementAt(1).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (2 / 11) * pi);
      expect(petal.color, Colors.blue);

      petal = petals.elementAt(2).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (4 / 11) * pi);
      expect(petal.color, Colors.lightBlue);

      petal = petals.elementAt(3).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (6 / 11) * pi);
      expect(petal.color, Colors.lightGreen);

      petal = petals.elementAt(4).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (8 / 11) * pi);
      expect(petal.color, Colors.indigo);

      petal = petals.elementAt(5).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (10 / 11) * pi);
      expect(petal.color, Colors.amber);

      petal = petals.elementAt(6).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (12 / 11) * pi);
      expect(petal.color, Colors.blueGrey);

      petal = petals.elementAt(7).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (14 / 11) * pi);
      expect(petal.color, Colors.deepOrange);

      petal = petals.elementAt(8).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (16 / 11) * pi);
      expect(petal.color, Colors.lime);

      petal = petals.elementAt(9).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (18 / 11) * pi);
      expect(petal.color, Colors.purple);

      petal = petals.elementAt(10).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (20 / 11) * pi);
      expect(petal.color, Colors.green);
    });

    testWidgets('has an invisible button with correct (small) size initially', (WidgetTester tester) async  {
      await setUpWidget(tester, store);

      Finder invisibleButton = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(GestureDetector));
      expect(invisibleButton, findsOneWidget);

      Container containerInsideButton = find.descendant(of: invisibleButton, matching: find.byType(Container)).evaluate().first.widget;
      expect(containerInsideButton.constraints, BoxConstraints(maxHeight: 100 /4, minHeight: 100 / 4, maxWidth: 100 / 4, minWidth: 100 / 4));
    });

    testWidgets('does not contain IconCircle initially', (WidgetTester tester) async {
      await setUpWidget(tester, store);

      Finder iconCircles = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(IconCircle));

      expect(iconCircles, findsNothing);
    });

    testWidgets("expands flower upon tapping it", (WidgetTester tester) async {
      await setUpWidget(tester, store);

      Finder invisibleButton = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(GestureDetector));

      await tester.tap(invisibleButton);
      await tester.pumpAndSettle();

      Finder iconCircles = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(IconCircle));

      expect(iconCircles, findsOneWidget);

      Container containerInsideButton = find.descendant(of: invisibleButton, matching: find.byType(Container)).evaluate().first.widget;
      expect(containerInsideButton.constraints, BoxConstraints(maxHeight: 300 /4, minHeight: 300 / 4, maxWidth: 300 / 4, minWidth: 300 / 4));
    });

    testWidgets("minimizes flower when it is tapped in the middle when it is large", (WidgetTester tester) async {
      await setUpWidget(tester, store);

      Finder invisibleButton = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(GestureDetector));

      await tester.tap(invisibleButton);
      await tester.pumpAndSettle();
      Finder iconCircles = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(IconCircle));
      expect(iconCircles, findsOneWidget);

      invisibleButton = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(GestureDetector)).first;
      print(invisibleButton);

      await tester.tap(invisibleButton);
      await tester.pumpAndSettle();


      iconCircles = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(IconCircle));

      expect(iconCircles, findsNothing);
    });
  });


}

Future<void> setUpWidget(WidgetTester tester, Store store) async {
  await tester.pumpWidget(
    StoreProvider<AppState>(
      store: store,
      child: LearningCompassApp(),
      /*
      child: MaterialApp(
        home: Flower(
          flowerSize: 347.9,
        ),
      ),
      */
    ),
  );

  await tester.pump();
  await tester.pump();
}
