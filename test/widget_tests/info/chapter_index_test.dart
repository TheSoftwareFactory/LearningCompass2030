import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/screens/info/chapter_index/chapter_index.dart';
import 'package:learning_compass_exp/screens/info/chapter_index/chapter_index_card.dart';
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


  group("ChapterIndex widget", () {
    testWidgets('shows correct message when no proper data can be accessed', (WidgetTester tester) async {
      await setUpWidget(tester, null);

      expect(find.text('Waiting on data...'), findsOneWidget);
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
