import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mockito/mockito.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/screens/info/chapter_screen/chapter_screen_body.dart';
import 'package:learning_compass_exp/screens/info/chapter_index/chapter_index.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/data/models/construct_progress_state.dart';
import 'package:learning_compass_exp/data/models/chapter_state.dart';

import '../../mock_data.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final TestWidgetsFlutterBinding binding =
  TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }


  group("ChapterScreenBody widget", () {
    Future<void> setUpWidget(WidgetTester tester, Store<AppState> store) async {
      if (store == null) {
        store = Store<AppState>(
          appReducer,
          initialState: AppState.initial(MOCK_STATIC_JSON),
        );
      }


      ChapterScreenBody body = ChapterScreenBody(
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
        chapter: MOCK_STATIC_JSON.first['chapters'].first,
      );
      await tester.pumpWidget(StoreProvider(
        store: store,
        child: MaterialApp(
          home: Scaffold(
            body: body,
          ),
        ),
      ));

      await tester.pump();
      await tester.pump();
    }

    testWidgets('shows chapter description', (WidgetTester tester) async {
      await setUpWidget(tester, null);

      expect(find.widgetWithText(Container, "Introducing the new and exciting concept of Work-Life Balance"), findsOneWidget);
    });

    testWidgets('has button with correct text when chapter not read', (WidgetTester tester) async {
      await setUpWidget(tester, null);

      expect(find.widgetWithText(RaisedButton, 'I agree to the te.... I mean I\'ve read this chapter!'), findsOneWidget);
    });

    testWidgets('has button with correct text when chapter is read', (WidgetTester tester) async {
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
                    id: 1,
                    read: true,
                  )
                }
            )
          },
        ),
      );

      await setUpWidget(tester, store);

      expect(find.widgetWithText(RaisedButton, 'You\'ve already read this chapter'), findsOneWidget);
    });



  });


}


