import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:learning_compass_exp/screens/info/chapter_screen/star_info_dialog.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
  TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("StarInfoDialog widget", () {
    testWidgets('has AlertDialog with correct title text', (WidgetTester tester) async {
      await setUpWidget(tester);

      Finder dialog = find.widgetWithText(AlertDialog, 'Find Magic Words!');
      expect(dialog, findsOneWidget);
    });

    testWidgets('has correct info text', (WidgetTester tester) async {
      await setUpWidget(tester);

      expect(find.text('Find magic words within the text to get extra points and interesting extra information!'), findsOneWidget);
      expect(find.text('Find a relevant word within the text and tap it to get fun information and a star!'), findsOneWidget);
    });

    testWidgets('has a FlatButton for dismiss with correct text', (WidgetTester tester) async {
      await setUpWidget(tester);

      expect(find.widgetWithText(FlatButton, 'Okay, got it!'), findsOneWidget);
    });
  });
}

Future<void> setUpWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: StarInfoDialog(),
    ),
  );

  await tester.pump();
  await tester.pump();
}
