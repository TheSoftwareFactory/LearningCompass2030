import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:learning_compass_exp/screens/info/chapter_screen/magic_word_bar.dart';
import 'package:learning_compass_exp/screens/info/chapter_screen/star_info_dialog.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/data/models/chapter_state.dart';

import 'package:learning_compass_exp/data/constants/MISC_CONSTANTS.dart';

import '../../mock_data.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("MagicWordBard widget", () {
    testWidgets('has no star icons when no magic words exist', (WidgetTester tester) async {
      await setUpWidget(tester, null);

      Finder starIcons = find.descendant(of: find.byType(Wrap), matching: find.byType(Icon));
      expect(starIcons, findsNothing);
    });

    testWidgets('has correct stars when magic words exist but no words are found', (WidgetTester tester) async {
      await setUpWidget(tester, ChapterState(id: 2, maxProgress: POINTS_FOR_READ+3));

      Finder starIcons = find.descendant(of: find.byType(Wrap), matching: find.byType(Icon));
      Icon firstStar = starIcons.evaluate().first.widget;
      expect(starIcons, findsNWidgets(3));
      expect(firstStar.icon, Icons.star_border);
    });

    testWidgets('has filled stars when some words found', (WidgetTester tester) async {
      await setUpWidget(tester, ChapterState(id: 2, maxProgress: POINTS_FOR_READ+3, foundWords: ['one']));

      Finder starIcons = find.descendant(of: find.byType(Wrap), matching: find.byType(Icon));
      Icon firstStar = starIcons.evaluate().first.widget;
      Icon secondStar = starIcons.evaluate().elementAt(1).widget;

      expect(firstStar.icon, Icons.star);
      expect(secondStar.icon, Icons.star_border);
    });

    testWidgets('has button for info that displays an info dialog when tapped', (WidgetTester tester) async {
      await setUpWidget(tester, null);

      Finder infoButton = find.byType(IconButton);

      expect(find.byType(StarInfoDialog), findsNothing);

      await tester.tap(infoButton);
      await tester.pumpAndSettle();

      expect(find.byType(StarInfoDialog), findsOneWidget);
      expect(find.text('Find magic words within the text to get extra points and interesting extra information!'), findsOneWidget);
    });
  });
}

Future<void> setUpWidget(WidgetTester tester, ChapterState chapterState) async {
  MagicWordBar bar = MagicWordBar(
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
    chapterState: chapterState == null ? ChapterState(id: 1) : chapterState,
  );
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: bar,
      ),
    ),
  );

  await tester.pump();
  await tester.pump();
}
