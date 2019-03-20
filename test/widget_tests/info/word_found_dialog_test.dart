import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:learning_compass_exp/screens/construct_info/widgets/chapter_screen/word_found_dialog.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
  TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("WordFoundDialog widget", () {
    testWidgets('has correct notice text when found word is newly found', (WidgetTester tester) async {
      await setUpWidget(tester, false);

      expect(find.text("Congratulations, you've just found a Magic Word!"), findsOneWidget);
    });

    testWidgets('has ocrrect notice text when found word is not newly found', (WidgetTester tester) async {
      await setUpWidget(tester, true);

      expect(find.text("You've already found this word."), findsOneWidget);
    });

    testWidgets('shows bonusinfo correctly', (WidgetTester tester) async {
      await setUpWidget(tester, false);

      expect(find.text('This information is very special and all that.'), findsOneWidget);
    });

    testWidgets('has a star', (WidgetTester tester) async {
      await setUpWidget(tester, true);

      expect(find.widgetWithIcon(Container, Icons.star), findsOneWidget);
    });

  });
}

Future<void> setUpWidget(WidgetTester tester, bool found) async {
  await tester.pumpWidget(
    MaterialApp(
      home: WordFoundDialog(
        isWordFound: found,
        bonusInfo: 'This information is very special and all that.',
      ),
    ),
  );

  await tester.pump();
  await tester.pump();
}
