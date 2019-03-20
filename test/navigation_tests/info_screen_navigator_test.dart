import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mockito/mockito.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

import 'package:learning_compass_exp/screens/info/chapter_index/chapter_index.dart';
import 'package:learning_compass_exp/screens/info/chapter_index/chapter_index_card.dart';
import 'package:learning_compass_exp/screens/info/chapter_screen/chapter_screen.dart';
import 'package:learning_compass_exp/screens/info/chapter_screen/chapter_content.dart';
import 'package:learning_compass_exp/screens/info/chapter_screen/star_info_dialog.dart';

import '../mock_data.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Info screen', () {
    NavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    Future<void> _buildInfoScreen(WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        appReducer,
        initialState:
        AppState.initial(MOCK_STATIC_JSON).copyWith(firstStartUp: false),
      );

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: MaterialApp(
            home: ChapterIndex(
              subject: Petal(
                'Test Petal',
                name: PetalName.safety,
                color: Colors.brown,
                icon: Icons.sort,
                pathToThemeImage: 'path/to/theme',
                pathToAssetData: 'path/to/asset',
                route: '/test',
                angle: 69.0,
              ),
              chapters: MOCK_STATIC_JSON.first['chapters'],
            ),
            navigatorObservers: [mockObserver],
          ),
        ),
      );

      await tester.pump();
      await tester.pump();

      verify(mockObserver.didPush(any, any));
    }

    testWidgets('navigates to chapter screen correctly when tapping on index card', (WidgetTester tester) async {
      await _buildInfoScreen(tester);

      expect(find.byType(ChapterScreen),findsNothing);

      await tester.tap(find.byType(ChapterIndexCard));
      await tester.pumpAndSettle();

      verify(mockObserver.didPush(any, any)).called(1);

      expect(find.byType(ChapterContent), findsOneWidget);

      RichText text = find.descendant(of: find.byType(ChapterContent), matching: find.byType(RichText)).evaluate().first.widget;
      // RichText doesn't have a built-in way to extract the full intact string it contains afaik
      String fullTextDesc = text.text.children.fold("", (prev, element) => prev.toString() + element.text);
      expect(fullTextDesc, "Some short data here");
    });

    testWidgets('navigates to index page when tapping button at the bottom of the chapter screen', (WidgetTester tester) async {
      await _buildInfoScreen(tester);

      await tester.tap(find.byType(ChapterIndexCard));
      await tester.pumpAndSettle();

      expect(find.byType(ChapterIndex), findsNothing);

      await tester.tap(find.widgetWithText(RaisedButton, 'I agree to the te.... I mean I\'ve read this chapter!'));
      await tester.pumpAndSettle();

      verify(mockObserver.didPush(any, any)).called(1);
      verify(mockObserver.didPop(any, any)).called(1);

      expect(find.byType(ChapterContent), findsNothing);
      expect(find.byType(ChapterIndex), findsOneWidget);
    });

    testWidgets('shows dialog when tapping on info button in the magic word bar at the top of the chapter screen that displays info on finding magic words', (WidgetTester tester) async {
      await _buildInfoScreen(tester);

      await tester.tap(find.byType(ChapterIndexCard));
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithIcon(IconButton, Icons.info_outline));
      await tester.pumpAndSettle();

      verify(mockObserver.didPush(any, any)).called(2);

      expect(find.byType(StarInfoDialog),findsOneWidget);
      expect(find.text('Find magic words within the text to get extra points and interesting extra information!'), findsOneWidget);
    });

    testWidgets('dismisses StarInfoDialog properly when button on it is tapped', (WidgetTester tester) async {
      await _buildInfoScreen(tester);

      await tester.tap(find.byType(ChapterIndexCard));
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithIcon(IconButton, Icons.info_outline));
      await tester.pumpAndSettle();

      expect(find.byType(StarInfoDialog),findsOneWidget);

      await tester.tap(find.widgetWithText(FlatButton, "Okay, got it!"));
      await tester.pumpAndSettle();

      expect(find.byType(StarInfoDialog), findsNothing);

      verify(mockObserver.didPush(any, any)).called(2);
      verify(mockObserver.didPop(any, any)).called(1);
    });
  });
}
