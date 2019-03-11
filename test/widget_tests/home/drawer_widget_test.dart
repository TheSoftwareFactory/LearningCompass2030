import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_compass_exp/screens/home/widgets/drawer/drawer.dart';


void main() {
  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,

    );
  }


  int expectedListTile = 3;
  testWidgets(
      'Check if drawer has a ListView, UserAccountsDrawerHeader, and 3 ListTile'
          'currentAccountPicture',
          (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(child: MenuDrawer()));
        expect(find.byType(ListView), findsOneWidget);
        expect(find.byType(UserAccountsDrawerHeader), findsOneWidget);
        expect(find.byType(ListTile), findsNWidgets(expectedListTile));
      });


  int expectedTexts = 2; // one for accountName, and one for accountEmail
  testWidgets(
      'Check if UserAccountsDrawerHeader has accountName, accountEmail and'
          'currentAccountPicture',
          (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(child: MenuDrawer()));


        expect(find.descendant(
            of: find.byType(UserAccountsDrawerHeader),
            matching: find.byType(CircleAvatar)
            ,
            matchRoot: false), findsOneWidget);


        expect(find.descendant(
            of: find.byType(UserAccountsDrawerHeader),
            matching: find.byType(Text)
            ,
            matchRoot: false), findsNWidgets(expectedTexts));
            //UserAccountsDrawerHeader 2 Text children(accountName and accountEmail)
      });


  int expectedListTileIcons = 3; // for 3 ListTiles
  int expectedListTileTexts = 3; // for 3 ListTiles
  testWidgets(
      'Check if ListTile has an Icon and Title ',
          (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(child: MenuDrawer()));

        expect(find.descendant(
            of: find.byType(ListTile),
            matching: find.byType(Icon)
            ,
            matchRoot: false), findsNWidgets(expectedListTileIcons));


        expect(find.descendant(
            of: find.byType(ListTile),
            matching: find.byType(Text)
            ,
            matchRoot: false), findsNWidgets(expectedListTileTexts));
      });
}


