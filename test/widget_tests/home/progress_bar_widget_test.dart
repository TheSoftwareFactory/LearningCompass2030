import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:learning_compass_exp/screens/home/widgets/flower/icon_popup/progress_bar.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/constants/PETAL_CONSTANTS.dart';

main() {
  group('ProgressBar Widget', () {
    final Petal petal = PETAL_CONSTANTS.income;

    testWidgets('draws ProgressBar widget with petal colored progress bar',
        (WidgetTester tester) async {
      final double progress = 1;

      await tester.pumpWidget(
        MaterialApp(
          home: ProgressBar(
            petal: petal,
            progress: progress,
          ),
        ),
      );

      Container bar = find
          .descendant(
              of: find.byType(ClipRRect), matching: find.byType(Container))
          .evaluate()
          .last
          .widget;

      BoxDecoration decoration = bar.decoration;

      expect(find.byType(ProgressBar), findsOneWidget);
      expect(decoration.color, petal.color);
    });

    testWidgets('has a percentage corresponding to given progress',
        (WidgetTester tester) async {
      final double progress = 0.58;

      await tester.pumpWidget(
        MaterialApp(
          home: ProgressBar(
            petal: petal,
            progress: progress,
          ),
        ),
      );

      Text percentage = find
          .descendant(of: find.byType(ProgressBar), matching: find.byType(Text))
          .evaluate()
          .first
          .widget;

      Container bar = find
          .descendant(
              of: find.byType(ClipRRect), matching: find.byType(Container))
          .evaluate()
          .last
          .widget;

      // at 58% the bar width should be twice the percentage
      expect(bar.constraints.biggest, Size(116.0, 20.0));
      expect(percentage.data, '58%');
    });

    testWidgets('has a percentage of 0 when given a progress of negative value',
        (WidgetTester tester) async {
      final double progress = -15.0;

      await tester.pumpWidget(
        MaterialApp(
          home: ProgressBar(
            petal: petal,
            progress: progress,
          ),
        ),
      );

      Text percentage = find
          .descendant(of: find.byType(ProgressBar), matching: find.byType(Text))
          .evaluate()
          .first
          .widget;

      Container bar = find
          .descendant(
              of: find.byType(ClipRRect), matching: find.byType(Container))
          .evaluate()
          .last
          .widget;

      expect(bar.constraints.biggest, Size(0.0, 20.0));
      expect(percentage.data, '0%');
    });

    testWidgets('has a percentage of 100 when given a progress over 1.0',
        (WidgetTester tester) async {
      final double progress = 2.0;

      await tester.pumpWidget(
        MaterialApp(
          home: ProgressBar(
            petal: petal,
            progress: progress,
          ),
        ),
      );

      Text percentage = find
          .descendant(of: find.byType(ProgressBar), matching: find.byType(Text))
          .evaluate()
          .first
          .widget;

      Container bar = find
          .descendant(
              of: find.byType(ClipRRect), matching: find.byType(Container))
          .evaluate()
          .last
          .widget;

      // at 100% the bar should have 200.0 as width
      expect(bar.constraints.biggest, Size(200.0, 20.0));
      expect(percentage.data, '100%');
    });
  });
}
