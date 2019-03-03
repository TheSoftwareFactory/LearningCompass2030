import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:math';

import 'package:learning_compass_exp/screens/home/widgets/flower/flower.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/flower_menu.dart';
import 'package:learning_compass_exp/app.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/flower_petal.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';

import '../mock_data.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("Flower widget", () {
    final Store<AppState> store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(MOCK_STATIC_JSON),
      //middleware: createStoreMiddleware(),
    );

    testWidgets("sets size correctly around the flower",
        (WidgetTester tester) async {
      await setUpWidget(tester);

      await tester.pump();
      await tester.pump();

      // Find first container inside flower (ie. immediate child)
      Container cont = find
          .descendant(of: find.byType(Flower), matching: find.byType(Container))
          .evaluate()
          .first
          .widget;

      // Check that it's padding property is set correctly
      // 100 is the size of the flower when it's small
      expect(cont.constraints, BoxConstraints.expand(width: 100, height: 100));
    });

    testWidgets("sets insets correctly around the flower to center it",
        (WidgetTester tester) async {
      await setUpWidget(tester);

      Container cont = find
          .descendant(of: find.byType(Flower), matching: find.byType(Container))
          .evaluate()
          .first
          .widget;

      // width and height in a Container translate into BoxConstraints
      // 100 is the size of the flower when it's small
      expect(cont.padding, EdgeInsets.only(left: 100 / 2, top: 100 / 2));
    });

    testWidgets("has a Stack widget", (WidgetTester tester) async {
      await setUpWidget(tester);

      Container cont = find
          .descendant(of: find.byType(Flower), matching: find.byType(Container))
          .evaluate()
          .first
          .widget;

      expect(cont.child.runtimeType, Stack);
    });

    testWidgets("contains 11 petals", (WidgetTester tester) async {
      await setUpWidget(tester);

      expect(find.byType(FlowerPetal).evaluate().length, 11);
    });

    testWidgets("assigns correct parameters to Flower Petals",
        (WidgetTester tester) async {
      await setUpWidget(tester);

      var petals = find.byType(FlowerPetal).evaluate();

      FlowerPetal petal;

      // Might wanna separate into several tests. I left it like this to not
      // have to generate the widget 11 times.
      petal = petals.elementAt(0).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, 0.0);
      expect(petal.color, Colors.red[900]);

      petal = petals.elementAt(1).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (2 / 11) * pi);
      expect(petal.color, Colors.blueGrey);
      petal = petals.elementAt(2).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (4 / 11) * pi);
      expect(petal.color, Colors.orange[600]);

      petal = petals.elementAt(3).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (6 / 11) * pi);
      expect(petal.color, Colors.purple);

      petal = petals.elementAt(4).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (8 / 11) * pi);
      expect(petal.color, Colors.amber);

      petal = petals.elementAt(5).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (10 / 11) * pi);
      expect(petal.color, Colors.green);

      petal = petals.elementAt(6).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (12 / 11) * pi);
      expect(petal.color, Colors.lightGreen[400]);

      petal = petals.elementAt(7).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (14 / 11) * pi);
      expect(petal.color, Colors.red[400]);

      petal = petals.elementAt(8).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (16 / 11) * pi);
      expect(petal.color, Colors.blue);

      petal = petals.elementAt(9).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (18 / 11) * pi);
      expect(petal.color, Colors.cyan);

      petal = petals.elementAt(10).widget;
      expect(petal.progress, 50.0);
      expect(petal.angle, (20 / 11) * pi);
      expect(petal.color, Colors.teal[300]);
    });

    testWidgets("is correct size when it is small", (WidgetTester tester) async {
      await setUpWidget(tester);

      expect(store.state.flowerSmall, isTrue);

      Container cont = find
          .descendant(of: find.byType(Flower), matching: find.byType(Container))
          .evaluate()
          .first
          .widget;

      expect(cont.constraints, BoxConstraints.expand(width: 100, height: 100));
    });

    testWidgets('is correct size when it is large', (WidgetTester tester) async {
      await setUpWidget(tester);

      Finder invisibleButton = find.descendant(of: find.byType(FlowerMenu), matching: find.byType(GestureDetector));

      await tester.tap(invisibleButton);
      await tester.pumpAndSettle();

      Container cont = find
          .descendant(of: find.byType(Flower), matching: find.byType(Container))
          .evaluate()
          .first
          .widget;

      // Large flower is larger
      expect(cont.constraints, BoxConstraints.expand(width: (75 / 100) * 300, height: (75 / 100) * 300));
    });
  });


}

Future<void> setUpWidget(WidgetTester tester) async {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(MOCK_STATIC_JSON).copyWith(firstStartUp: false),
    //middleware: createStoreMiddleware(),
  );

  await tester.pumpWidget(LearningCompassApp(store: store,));

  await tester.pump();
  await tester.pump();
}
