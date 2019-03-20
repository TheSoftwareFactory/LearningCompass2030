import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mockito/mockito.dart';

import 'package:learning_compass_exp/routes.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal.dart';

import 'package:learning_compass_exp/screens/home/widgets/grid/grid_item.dart';
import 'package:learning_compass_exp/screens/construct_info/chapter_index.dart';
import 'package:learning_compass_exp/common/widgets/flower/icon_popup/icon_popup.dart';
import 'package:learning_compass_exp/common/widgets/custom_icon_button.dart';
import 'package:learning_compass_exp/common/widgets/custom_icons_icons.dart';

import '../mock_data.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  // Unable to tap on widgets that are off-screen automatically at least.
  // Perhaps this is intended as widget tests are closer to unit tests rather
  // than integration tests.
  group('Home screen', () {
    NavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    Future<void> _buildApp(WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        appReducer,
        initialState:
            AppState.initial(MOCK_STATIC_JSON).copyWith(firstStartUp: false),
      );

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: MaterialApp(
            initialRoute: '/',
            routes: routes,
            title: 'Learning Compass',
            navigatorObservers: [mockObserver],
          ),
        ),
      );

      await tester.pump();
      await tester.pump();

      verify(mockObserver.didPush(any, any));
    }

    group('grid navigation', () {
      testWidgets(
          'navigates to correct screen when clicking grid item Work-Life Balance',
          (WidgetTester tester) async {
        await _buildApp(tester);

        expect(find.byType(GridItem), findsNWidgets(11));

        await tester.tap(find.widgetWithText(GridItem, "Work-Life Balance"));
        await tester.pumpAndSettle();

        verify(mockObserver.didPush(any, any)).called(1);

        InfoScreen screen = find.byType(InfoScreen).evaluate().first.widget;
        Petal subject = screen.petal;

        expect(find.byType(GridItem), findsNothing);
        expect(find.byType(InfoScreen), findsOneWidget);
        expect(subject.toString(), "Work-Life Balance");
        expect(find.text("Work-Life Balance"), findsOneWidget);
      });

      testWidgets('navigates to correct screen when clicking grid item Safety',
          (WidgetTester tester) async {
        await _buildApp(tester);

        expect(find.byType(GridItem), findsNWidgets(11));

        await tester.tap(find.widgetWithText(GridItem, "Safety"));
        await tester.pumpAndSettle();

        verify(mockObserver.didPush(any, any)).called(1);

        InfoScreen screen = find.byType(InfoScreen).evaluate().first.widget;
        Petal subject = screen.petal;

        expect(find.byType(GridItem), findsNothing);
        expect(find.byType(InfoScreen), findsOneWidget);
        expect(subject.toString(), "Safety");
        expect(find.text("Safety"), findsOneWidget);
      });

      testWidgets(
          'navigates to correct screen when clicking grid item Life Satisfaction',
          (WidgetTester tester) async {
        await _buildApp(tester);

        expect(find.byType(GridItem), findsNWidgets(11));

        await tester.tap(find.widgetWithText(GridItem, "Life Satisfaction"));
        await tester.pumpAndSettle();

        verify(mockObserver.didPush(any, any)).called(1);

        InfoScreen screen = find.byType(InfoScreen).evaluate().first.widget;
        Petal subject = screen.petal;

        expect(find.byType(GridItem), findsNothing);
        expect(find.byType(InfoScreen), findsOneWidget);
        expect(subject.toString(), "Life Satisfaction");
        expect(find.text("Life Satisfaction"), findsOneWidget);
      });
    });

    group('flower icon navigation', () {
      testWidgets('shows dialog when clicking IconButton for Health',
          (WidgetTester tester) async {
        await _buildApp(tester);

        expect(find.byType(CustomIconButton), findsNWidgets(11));
        expect(find.byType(IconPopup), findsNothing);

        await tester
            .tap(find.widgetWithIcon(CustomIconButton, CustomIcons.health));
        await tester.pumpAndSettle();

        expect(find.byType(IconPopup), findsOneWidget);

        IconPopup popup = find.byType(IconPopup).evaluate().first.widget;
        Petal subject = popup.petal;
        expect(subject.toString(), "Health");
      });

      testWidgets('shows dialog when clicking IconButton for Jobs',
          (WidgetTester tester) async {
        await _buildApp(tester);

        expect(find.byType(CustomIconButton), findsNWidgets(11));
        expect(find.byType(IconPopup), findsNothing);

        await tester
            .tap(find.widgetWithIcon(CustomIconButton, CustomIcons.jobs));
        await tester.pumpAndSettle();

        expect(find.byType(IconPopup), findsOneWidget);

        IconPopup popup = find.byType(IconPopup).evaluate().first.widget;
        Petal subject = popup.petal;
        expect(subject.toString(), "Jobs");
      });

      testWidgets('shows dialog when clicking IconButton for Housing',
          (WidgetTester tester) async {
        await _buildApp(tester);

        expect(find.byType(CustomIconButton), findsNWidgets(11));
        expect(find.byType(IconPopup), findsNothing);

        await tester
            .tap(find.widgetWithIcon(CustomIconButton, CustomIcons.housing));
        await tester.pumpAndSettle();

        expect(find.byType(IconPopup), findsOneWidget);

        IconPopup popup = find.byType(IconPopup).evaluate().first.widget;
        Petal subject = popup.petal;
        expect(subject.toString(), "Housing");
      });

      testWidgets('navigates to correct screen when tapping the button on icon popup dialog', (WidgetTester tester) async {
        await _buildApp(tester);

        await tester.tap(find.widgetWithIcon(CustomIconButton, CustomIcons.community));
        await tester.pumpAndSettle();
        await tester.tap(find.widgetWithText(RaisedButton, 'Go to info page'));
        await tester.pumpAndSettle();

        verify(mockObserver.didPush(any, any)).called(2); // showing dialog uses navigator


        expect(find.byType(GridItem), findsNothing);
        expect(find.byType(InfoScreen), findsOneWidget);

        InfoScreen screen = find.byType(InfoScreen).evaluate().first.widget;
        Petal subject = screen.petal;

        expect(subject.toString(), "Community");
        expect(find.text("Community"), findsOneWidget);
      });
    });
  });
}
