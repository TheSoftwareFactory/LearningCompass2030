import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:learning_compass_exp/screens/home/widgets/grid_item.dart';

void main() {
  group('GridItem Widget', () {
    final _lifeSatisfactionItem = {
      'name': 'Life Satisfaction',
      'color': Colors.orange[600]
    };

    testWidgets('draws one FlatButton with Text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: GridItem(
              item: _lifeSatisfactionItem
          )
      ));

      expect(find.byType(FlatButton), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('draws a FlatButton with given color and text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: GridItem(
            item: _lifeSatisfactionItem
          )
      ));

      FlatButton button = tester.widget<FlatButton>(find.byType(FlatButton));

      Text buttonText = find.descendant(
        of: find.byType(FlatButton),
        matching: find.byType(Text)
      ).evaluate().first.widget;

      expect(button.color, Color(0xFFFB8C00));
      expect(buttonText.data, 'Life Satisfaction');
    });
  });
}