import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:learning_compass_exp/screens/home/widgets/welcome_dialog.dart';
import 'package:learning_compass_exp/app.dart';
import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/reducers/app_state_reducer.dart';

import '../../mock_data.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
  TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("WelcomeDialog widget", () {
    testWidgets('exists upon first startup', (WidgetTester tester) async  {
      await setUpWidget(tester);

      Finder welcomeDialog = find.byType(WelcomeDialog);
      expect(welcomeDialog, findsOneWidget);
    });

    testWidgets('contains Welcome text', (WidgetTester tester) async  {
      await setUpWidget(tester);

      Finder welcomeText = find.text("Welcome to the Learning Compass 2030 app!");
      expect(welcomeText, findsOneWidget);
    });

    testWidgets('contains two buttons with correct text', (WidgetTester tester) async  {
      await setUpWidget(tester);

      Finder buttons = find.descendant(of: find.byType(ButtonBar), matching: find.byType(FlatButton));
      expect(buttons, findsNWidgets(2));

      Finder skipButtonText = find.descendant(of: buttons.first, matching: find.text('SKIP'));
      expect(skipButtonText, findsOneWidget);

      Finder tourButtonText = find.descendant(of: buttons.at(1), matching: find.text('TAKE A TOUR'));
      expect(tourButtonText, findsOneWidget);
    });

    testWidgets('is dismissed by pushing SKIP', (WidgetTester tester) async  {
      await setUpWidget(tester);

      Finder skipButton = find.descendant(of: find.byType(ButtonBar), matching: find.byType(FlatButton)).first;

      await tester.tap(skipButton);
      await tester.pumpAndSettle();

      Finder welcomeDialog = find.byType(WelcomeDialog);
      expect(welcomeDialog, findsNothing);
    });

    testWidgets('is dismissed by pushing TAKE A TOUR', (WidgetTester tester) async  {
      await setUpWidget(tester);

      Finder skipButton = find.descendant(of: find.byType(ButtonBar), matching: find.byType(FlatButton)).at(1);

      await tester.tap(skipButton);
      await tester.pumpAndSettle();

      Finder welcomeDialog = find.byType(WelcomeDialog);
      expect(welcomeDialog, findsNothing);
    });
  });


}

Future<void> setUpWidget(WidgetTester tester) async {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(MOCK_STATIC_JSON).copyWith(firstStartUp: true),
    //middleware: createStoreMiddleware(),
  );
  await tester.pumpWidget(LearningCompassApp(store: store,));

  await tester.pump();
  await tester.pump();
}
