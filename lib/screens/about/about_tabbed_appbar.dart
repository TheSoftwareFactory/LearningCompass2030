import 'package:flutter/material.dart';
import 'package:learning_compass_exp/screens/about/about_tabbarview_choice.dart';

class AboutTabbedAppBar extends StatelessWidget {
  final List<dynamic> choices;
  const AboutTabbedAppBar({Key key, this.choices}) : super(key: key);

  List<Widget> _jsonToListOfChoiceTabBars(List<dynamic> json) {
    List<Widget> newList = new List<Widget>();

    json.forEach((element) {
      newList.add(Tab(
        text: element['title'],
      ));
    });

    return newList;
  }

  List<Widget> _jsonToListOfChoiceViews(List<dynamic> json) {
    List<Widget> choiceList = new List<Widget>();

    json.forEach((element) {
      choiceList.add(AboutTabBarViewChoice(choice: element));
    });

    return choiceList;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: this.choices.length,
        child: Scaffold(
            appBar: AppBar(
                title: const Text('About Learning Compass'),
                bottom: TabBar(
                    isScrollable: true,
                    tabs: _jsonToListOfChoiceTabBars(this.choices))),
            body: TabBarView(
              children: _jsonToListOfChoiceViews(this.choices),
            )));
  }
}
