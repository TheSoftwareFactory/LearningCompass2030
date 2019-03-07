import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_compass_exp/screens/about/about_tabbed_appbar.dart';

void main() {



  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,

    );
  }

  const List<dynamic> _choices = const <dynamic>[

  {
  "title": "OECD",
  "content": [
  {
  "title": "Introduction",
  "body": " OECD Education 2030 stakeholders havt is about orientation. "
  }
  ]
  },
  {
  "title": "TRENDS",
  "content": [
  {
  "title": "",
  "body": "The world is evolving at an incredible speed. "
  },
  {
  "title": "",
  "body": "Some of the key mega trends are presented.  "
  }
  ]}]
  ;

  testWidgets('Check if About(tabbed appbar) has Appbar, tabs and tabbarview.',

          (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(
      child: AboutTabbedAppBar(choices: _choices)
    ));
    expect(find.byType(AppBar), findsWidgets);
    expect(find.byType(TabBar), findsWidgets);
    expect(find.byType(Tab), findsWidgets);

       }


  );



}


class Choice {
  const Choice({this.title, this.choiceBody});

  final String title;
  final  List <dynamic >choiceBody;
}