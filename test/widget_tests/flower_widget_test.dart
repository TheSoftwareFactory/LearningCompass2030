import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

import 'package:learning_compass_exp/app.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower_petal.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("Flower widget", () {
    testWidgets("sets padding correctly around the flower to center it",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        LearningCompassApp(),
      );

      await tester.pump();
      await tester.pump();

      // Find first container inside flower (ie. immediate child)
      Container cont = find
          .descendant(of: find.byType(Flower), matching: find.byType(Container))
          .evaluate()
          .first
          .widget;
      Flower flower = find.byType(Flower).evaluate().first.widget;

      // Check that it's padding property is set correctly
      expect(
          cont.padding,
          EdgeInsets.only(
            left: flower.flowerSize / 2,
            top: flower.flowerSize / 2,
          ));
    });

    testWidgets("sets width and height correctly around the petals", (WidgetTester tester) async {
      await tester.pumpWidget(
        LearningCompassApp(),
      );

      await tester.pump();
      await tester.pump();

      Container cont = find
          .descendant(of: find.byType(Flower), matching: find.byType(Container))
          .evaluate()
          .elementAt(1)
          .widget;

      Flower flower = find.byType(Flower).evaluate().first.widget;

      // width and height in a Container translate into BoxConstraints
      expect(cont.constraints, BoxConstraints.expand(width: flower.flowerSize / 2, height: flower.flowerSize / 2));
    });

    testWidgets("has a Stack widget", (WidgetTester tester) async {
      await tester.pumpWidget(
        LearningCompassApp(),
      );

      await tester.pump();
      await tester.pump();

      Container cont = find
          .descendant(of: find.byType(Flower), matching: find.byType(Container))
          .evaluate()
          .elementAt(1)
          .widget;

      expect(cont.child.runtimeType, Stack);
    });

    testWidgets("contains 11 petals", (WidgetTester tester) async {
      await tester.pumpWidget(
        LearningCompassApp(),
      );

      await tester.pump();
      await tester.pump();

      expect(find.descendant(of: find.byType(Flower), matching: find.byType(FlowerPetal)).evaluate().length, 11);
    });

    testWidgets("assigns correct parameters to Flower Petals", (WidgetTester tester) async {
      await tester.pumpWidget(
        LearningCompassApp(),
      );

      await tester.pump();
      await tester.pump();


      var petals = find.descendant(of: find.byType(Flower), matching: find.byType(FlowerPetal)).evaluate();
      Flower flower = find.byType(Flower).evaluate().first.widget;

      FlowerPetal petal;

      // Might wanna separate into several tests. I left it like this to not
      // have to generate the widget 11 times.
      petal = petals.elementAt(0).widget;
      expect(petal.petalName, PetalName.education);
      expect(petal.angle, 0.0);
      expect(petal.maxPetalSize, flower.flowerSize / 2);
      expect(petal.color, Colors.green);

      petal = petals.elementAt(1).widget;
      expect(petal.petalName, PetalName.community);
      expect(petal.angle, (2 / 11) * pi);
      expect(petal.maxPetalSize, flower.flowerSize / 2);
      expect(petal.color, Colors.red);

      petal = petals.elementAt(2).widget;
      expect(petal.petalName, PetalName.job);
      expect(petal.angle, (4 / 11) * pi);
      expect(petal.maxPetalSize, flower.flowerSize / 2);
      expect(petal.color, Colors.blue);

      petal = petals.elementAt(3).widget;
      expect(petal.petalName, PetalName.income);
      expect(petal.angle, (6 / 11) * pi);
      expect(petal.maxPetalSize, flower.flowerSize / 2);
      expect(petal.color, Colors.amber);

      petal = petals.elementAt(4).widget;
      expect(petal.petalName, PetalName.housing);
      expect(petal.angle, (8 / 11) * pi);
      expect(petal.maxPetalSize, flower.flowerSize / 2);
      expect(petal.color, Colors.blueGrey);

      petal = petals.elementAt(5).widget;
      expect(petal.petalName, PetalName.workLifeBalance);
      expect(petal.angle, (10 / 11) * pi);
      expect(petal.maxPetalSize, flower.flowerSize / 2);
      expect(petal.color, Colors.cyan);

      petal = petals.elementAt(6).widget;
      expect(petal.petalName, PetalName.safety);
      expect(petal.angle, (12 / 11) * pi);
      expect(petal.maxPetalSize, flower.flowerSize / 2);
      expect(petal.color, Colors.deepOrange);

      petal = petals.elementAt(7).widget;
      expect(petal.petalName, PetalName.lifeSatisfaction);
      expect(petal.angle, (14 / 11) * pi);
      expect(petal.maxPetalSize, flower.flowerSize / 2);
      expect(petal.color, Colors.lightGreen);

      petal = petals.elementAt(8).widget;
      expect(petal.petalName, PetalName.health);
      expect(petal.angle, (16 / 11) * pi);
      expect(petal.maxPetalSize, flower.flowerSize / 2);
      expect(petal.color, Colors.purple);

      petal = petals.elementAt(9).widget;
      expect(petal.petalName, PetalName.civicEngagement);
      expect(petal.angle, (18 / 11) * pi);
      expect(petal.maxPetalSize, flower.flowerSize / 2);
      expect(petal.color, Colors.indigo);

      petal = petals.elementAt(10).widget;
      expect(petal.petalName, PetalName.environment);
      expect(petal.angle, (20 / 11) * pi);
      expect(petal.maxPetalSize, flower.flowerSize / 2);
      expect(petal.color, Colors.lime);
    });
  });
}
