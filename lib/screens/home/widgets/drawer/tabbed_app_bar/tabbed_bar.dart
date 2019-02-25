import 'package:flutter/material.dart';
import 'package:learning_compass_exp/screens/home/widgets/drawer/tabbed_app_bar/tabbed_bar_choice_body.dart';
import 'package:learning_compass_exp/screens/home/widgets/drawer/tabbed_app_bar/tabbed_bar_choice.dart';


//this will come from json
const List<ChoiceBody> choicesBodies = const <ChoiceBody>[
  const ChoiceBody('title', 'body'),
  const ChoiceBody('title', 'body'),
  const ChoiceBody('title', 'body'),
  const ChoiceBody('title', 'body'),
];

//this will come from json
const List<Choice> choices = const <Choice>[
  const Choice(title: 'OECD', body: choicesBodies ),
  const Choice(title: 'TRENDS', body: choicesBodies ),
  const Choice(title: 'FRAMEWORK',  body: choicesBodies ),
  const Choice(title: 'ANALYSIS',  body: choicesBodies ),
];




  class AboutTabbedAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('About Learning Compass'),
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
                child: ChoiceWidget(choice: choice),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
