import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/screens/construct_info/chapter_screen.dart';
import 'package:learning_compass_exp/screens/construct_info/widgets/chapter_screen/chapter_selection_bar.dart';
import 'package:learning_compass_exp/screens/construct_info/widgets/chapter_screen/chapter_screen_body.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';

import '../../mock_data.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("ChapterScreen widget", () {
    testWidgets('has one Scaffold widget', (WidgetTester tester) async {
      await setUpWidget(tester);

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('has correct title in AppBar', (WidgetTester tester) async {
      await setUpWidget(tester);

      expect(find.widgetWithText(AppBar, "Test Petal"), findsOneWidget);
    });

    testWidgets('has ChapterSelectionBar with correct properties',
        (WidgetTester tester) async {
      await setUpWidget(tester);

      ChapterSelectionBar selectionBar =
          find.byType(ChapterSelectionBar).evaluate().first.widget;
      expect(selectionBar.chapters, ['Introduction']);
      expect(selectionBar.subroute, 'Introduction');
      expect(
          selectionBar.shadedColor,
          Color.fromRGBO(
              (Colors.brown.red * 0.9).round(),
              (Colors.brown.green * 0.8).round(),
              (Colors.brown.blue * 0.8).round(),
              1.0));
    });

    testWidgets('has ChapterScreenBody widget with correct properties',
        (WidgetTester tester) async {
      await setUpWidget(tester);

      ChapterScreenBody body =
          find.byType(ChapterScreenBody).evaluate().first.widget;
      expect(
          body.subject,
          Petal(
            'Test Petal',
            name: PetalName.safety,
            color: Colors.brown,
            icon: Icons.sort,
            pathToThemeImage: 'path/to/theme',
            pathToAssetData: 'path/to/asset',
            route: '/test',
            angle: 69.0,
          ));
      expect(body.chapter, {
        'id': 1,
        'title': 'Introduction',
        'description':
            'Introducing the new and exciting concept of Work-Life Balance',
        'wordsToFind': [
          {'word': 'some', 'bonusInfo': 'Some is a word'},
          {'word': 'short', 'bonusInfo': 'short is not a word'},
          {'word': 'data', 'bonusInfo': 'something is wrong.'}
        ],
        'content': [
          {
            'title': '',
            'type': 'text',
            'data': 'Some short data here',
            'magicWords': [
              {'word': 'some', 'index': 0, 'bonusInfo': 'Some is a word'},
              {'word': 'short', 'index': 5, 'bonusInfo': 'short is not a word'},
              {'word': 'data', 'index': 11, 'bonusInfo': 'something is wrong.'}
            ]
          }
        ]
      });
    });
  });
}

Future<void> setUpWidget(WidgetTester tester) async {
  Store<AppState> store = Store<AppState>(
    appReducer,
    initialState:
        AppState.initial(MOCK_STATIC_JSON).copyWith(subroute: 'Introduction'),
  );

  ChapterScreen screen = ChapterScreen(
    petal: Petal(
      'Test Petal',
      name: PetalName.safety,
      color: Colors.brown,
      icon: Icons.sort,
      pathToThemeImage: 'path/to/theme',
      pathToAssetData: 'path/to/asset',
      route: '/test',
      angle: 69.0,
    ),
    chapters: List<dynamic>.from(MOCK_STATIC_JSON.first['chapters']),
  );
  await tester.pumpWidget(StoreProvider<AppState>(
    store: store,
    child: MaterialApp(
      home: screen,
    ),
  ));

  await tester.pump();
  await tester.pump();
}
