import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/gestures.dart';

import 'package:learning_compass_exp/screens/construct_info/widgets/chapter_screen/chapter_content.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/data/models/petal_names.dart';
import 'package:learning_compass_exp/data/models/chapter_state.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group("ChapterContent widget", () {
    testWidgets('shows correct title text', (WidgetTester tester) async {
      await setUpWidget(tester);

      expect(find.text('Noice title'), findsOneWidget);
    });

    testWidgets('shows data correctly', (WidgetTester tester) async {
      await setUpWidget(tester);

      RichText bodyText = find.descendant(of: find.byType(SizedBox), matching: find.byType(RichText)).evaluate().first.widget;

      expect(bodyText.text.children.length, 3);
      expect(bodyText.text.children.first.text, "");
      expect(bodyText.text.children[1].text, "Some");
      expect(bodyText.text.children[2].text, " very intriguing data here.... or not?");
    });

    testWidgets('has a tappable word in shown data', (WidgetTester tester) async {
      await setUpWidget(tester);

      RichText bodyText = find.descendant(of: find.byType(SizedBox), matching: find.byType(RichText)).evaluate().first.widget;

      expect(bodyText.text.children[1].recognizer.runtimeType, TapGestureRecognizer);
    });
  });
}

Future<void> setUpWidget(WidgetTester tester) async {
  ChapterContent content = ChapterContent(
    data: {
      'title': 'Noice title',
      'type': 'text',
      'magicWords': [{'word': 'some', 'index': 0, 'bonusInfo': 'Bonus information!'}],
      'data': 'Some very intriguing data here.... or not?',
    },
    color: Colors.brown,
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
    chapterState: ChapterState(
      id: 1,
    ),
  );
  await tester.pumpWidget(
    MaterialApp(
      home: content,
    ),
  );

  await tester.pump();
  await tester.pump();
}
