import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/screens/home/widgets/grid.dart';
import 'package:learning_compass_exp/screens/home/widgets/grid_item.dart';

import '../../mock_data.dart';



void main() {
  group('Grid Widget', () {
    testWidgets('adds a GridView', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Grid(),
        )
      );

      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('has 3 grid items per row in landscape orientation', (WidgetTester tester)  async {
      await tester.pumpWidget(
        MaterialApp(
          home: Grid(),
        )
      );

      final firstRowPosition = tester.getCenter(find.byType(GridItem).at(0)).dy;
      final secondRowPosition = tester.getCenter(find.byType(GridItem).at(3)).dy;

      expect(secondRowPosition, isNot(firstRowPosition));

      expect(tester.getCenter(find.byType(GridItem).at(1)).dy, firstRowPosition);
      expect(tester.getCenter(find.byType(GridItem).at(2)).dy, firstRowPosition);
      expect(tester.getCenter(find.byType(GridItem).at(4)).dy, secondRowPosition);
      expect(tester.getCenter(find.byType(GridItem).at(5)).dy, secondRowPosition);
    });

    testWidgets('has 2 grid items per row in portrait orientation', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
              data: MediaQueryData(size: Size(600, 800)),
              child: Grid(),
          ),
        ),
      );

      final firstRowPosition = tester.getCenter(find.byType(GridItem).at(0)).dy;
      final secondRowPosition = tester.getCenter(find.byType(GridItem).at(2)).dy;
      final thirdRowPosition = tester.getCenter(find.byType(GridItem).at(4)).dy;

      expect(secondRowPosition, isNot(firstRowPosition));
      expect(thirdRowPosition, isNot(secondRowPosition));
      expect(thirdRowPosition, isNot(firstRowPosition));

      expect(tester.getCenter(find.byType(GridItem).at(1)).dy, firstRowPosition);
      expect(tester.getCenter(find.byType(GridItem).at(3)).dy, secondRowPosition);
      expect(tester.getCenter(find.byType(GridItem).at(5)).dy, thirdRowPosition);
    });

    testWidgets('draws 11 Grid Items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Grid(),
        ),
      );

      expect(find.byType(GridItem), findsNWidgets(11));
    });

    testWidgets('draws grid items with right parameters', (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(MOCK_STATIC_JSON).copyWith(flowerSmall: false),
        //middleware: createStoreMiddleware(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: StoreProvider<AppState>(
            store: store,
            child: Grid(),
          ),
        ),
      );

      final List data = [
        { 'name': 'Work-Life Balance', 'color': Colors.red[900] },
        { 'name': 'Safety', 'color': Colors.blueGrey },
        { 'name': 'Life Satisfaction', 'color': Colors.orange[600] },
        { 'name': 'Health', 'color': Colors.purple },
        { 'name': 'Civic Engagement', 'color': Colors.amber },
        { 'name': 'Environment', 'color': Colors.green },
        { 'name': 'Education', 'color': Colors.lightGreen[400] },
        { 'name': 'Community', 'color': Colors.red[400] },
        { 'name': 'Jobs', 'color': Colors.blue },
        { 'name': 'Income', 'color': Colors.cyan },
        { 'name': 'Housing', 'color': Colors.teal[300] },
      ];

      Iterable items = find.byType(GridItem).evaluate();
      GridItem gridItem;

      for (var i = 0; i < 11; i++) {
        gridItem = items.elementAt(i).widget;
        final expectedValue = data[i];
        expect(gridItem.item.toString(), expectedValue['name']);
        expect(gridItem.item.color, expectedValue['color']);
      }
    });
  });
}