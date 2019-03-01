import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:learning_compass_exp/screens/home/widgets/flower/icon_popup/icon_popup.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/icon_popup/progress_bar.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/constants/PETAL_CONSTANTS.dart';

main() {
  group('IconPopup Widget', () {
    final Petal petal = PETAL_CONSTANTS.income;

    testWidgets('displays a Dialog', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: IconPopup(
            petal: petal,
          ),
        ),
      );

      expect(find.byType(Dialog), findsOneWidget);
    });

    testWidgets('has a ProgressBar', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: IconPopup(
            petal: petal,
          ),
        ),
      );

      expect(find.byType(ProgressBar), findsOneWidget);
    });

    testWidgets('has a RaisedButton with correct text and petal color',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: IconPopup(
            petal: petal,
          ),
        ),
      );

      RaisedButton button = find.byType(RaisedButton).evaluate().first.widget;

      Text buttonText = button.child;
      Color buttonColor = button.color;

      expect(find.byType(RaisedButton), findsOneWidget);
      expect(buttonText.data, 'Go to info page');
      expect(buttonColor, petal.color);
    });

    testWidgets('has the icon and name of the petal as title',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: IconPopup(
            petal: petal,
          ),
        ),
      );

      Row titleRow = find
          .descendant(of: find.byType(Dialog), matching: find.byType(Row))
          .evaluate()
          .first
          .widget;

      Icon titleIcon = find
          .descendant(of: find.byWidget(titleRow), matching: find.byType(Icon))
          .evaluate()
          .first
          .widget;

      Text titleText = titleRow.children[1];

      expect(titleIcon.icon, petal.icon);
      expect(titleText.data, petal.toString());
    });
  });
}
