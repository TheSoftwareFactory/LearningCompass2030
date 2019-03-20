import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/screens/construct_info/widgets/chapter_index/chapter_index_card.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/data/models/construct_progress_state.dart';
import 'package:learning_compass_exp/data/models/chapter_state.dart';

import '../../mock_data.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
  TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }


  group("ChapterIndexCard widget", () {
    testWidgets('shows correct title text', (WidgetTester tester) async {
      await setUpWidget(tester, null);

      expect(find.text('Introduction'), findsOneWidget);
    });

    testWidgets('shows description', (WidgetTester tester) async {
      await setUpWidget(tester, null);

      expect(find.text("Introducing the new and exciting concept of Work-Life Balance"), findsOneWidget);
    });

    testWidgets('does not show content', (WidgetTester tester) async {
      await setUpWidget(tester, null);

      expect(find.text('Some short data here'), findsNothing);
    });

    testWidgets('has red checkmark_outline by default', (WidgetTester tester) async {
      await setUpWidget(tester, null);

      Icon icon = find.descendant(of: find.byType(Row), matching: find.byType(Icon)).evaluate().first.widget;

      expect(icon.icon, Icons.check_circle_outline);
      expect(icon.color, Colors.red);
    });

    testWidgets('has green checkmark when chapter is read', (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        appReducer,
        initialState: AppState(
          subroute: 'asdf',
          firstStartUp: false,
          flowerSmall: true,
          progress: {
            PetalName.safety: ConstructProgressState(
              id: 1,
              constructProgress: {
                1: ChapterState(
                  id: 2,
                  read: true,
                )
              }
            )
          },
        ),
      );

      await setUpWidget(tester, store);

      Icon icon = find.descendant(of: find.byType(Row), matching: find.byType(Icon)).evaluate().first.widget;

      expect(icon.icon, Icons.check_circle);
      expect(icon.color, Colors.green);
    });

    testWidgets('expands description text when tapped', (WidgetTester tester) async {
      await setUpWidget(tester, null);

      Text desc = find.text("Introducing the new and exciting concept of Work-Life Balance").evaluate().first.widget;
      expect(desc.maxLines, 1);

      expect(find.descendant(of: find.byType(Card), matching: find.byType(InkWell)), findsNWidgets(2));
      await tester.tap(find.descendant(of: find.byType(Card), matching: find.byType(InkWell).at(1)));
      await tester.pumpAndSettle();

      desc = find.text("Introducing the new and exciting concept of Work-Life Balance").evaluate().first.widget;
      expect(desc.maxLines, 100);
    });
  });
}

Future<void> setUpWidget(WidgetTester tester, Store<AppState> store) async {
  if (store == null) {
    store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(MOCK_STATIC_JSON),
    );
  }


  ChapterIndexCard card = ChapterIndexCard(
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
    data: MOCK_STATIC_JSON.first['chapters'].first,
    navigateToInfoView: () { print('called'); },
  );
  await tester.pumpWidget(StoreProvider(
    store: store,
    child: MaterialApp(
      home: card,
    ),
  ));

  await tester.pump();
  await tester.pump();
}
