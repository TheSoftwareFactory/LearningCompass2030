import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.body, this.subtitle});

  final String title;
  final String subtitle;
  final String body;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'OECD', subtitle: ' ',  body: 'CAR' ),
  const Choice(title: 'TRENDS', body: 'CAR' ),
  const Choice(title: 'FRAMEWORK', body: 'CAR' ),
  const Choice(title: 'ANALYSIS', body: 'CAR' ),
];


class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(choice.title, style: textStyle),Text(choice.body, style: textStyle)
          ],
        ),
      ),
    );
  }

}
  class AboutTabbedAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tabbed AppBar'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,

                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
