import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/screens/construct_info/widgets/chapter_index/chapter_index.dart';
import 'package:learning_compass_exp/screens/construct_info/widgets/chapter_index/chapter_index_card.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';

import '../../mock_data.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("ChapterIndex widget", () {
    testWidgets('shows correct title', (WidgetTester tester) async {
      await setUpWidget(tester, null);

      expect(find.text('Test Petal'), findsOneWidget);
    });

    testWidgets('has correct number of ChapterIndexCards',
        (WidgetTester tester) async {
      await setUpWidget(tester, null);

      expect(find.byType(ChapterIndexCard), findsOneWidget);
    });

    testWidgets('has correct properties for ChapterIndexCards',
        (WidgetTester tester) async {
      await setUpWidget(tester, null);

      ChapterIndexCard card =
          find.byType(ChapterIndexCard).evaluate().first.widget;
      expect(card.data, MOCK_STATIC_JSON.first['chapters'].first);
      expect(
          card.subject,
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

  ChapterIndex card = ChapterIndex(
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
  );
  await tester.pumpWidget(
    StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          home: card,
        )),
  );

  await tester.pump();
  await tester.pump();
}
