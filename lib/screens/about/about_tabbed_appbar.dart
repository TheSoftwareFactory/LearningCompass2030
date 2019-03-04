import 'package:flutter/material.dart';
import 'package:learning_compass_exp/screens/about/about_tabbarview_choice.dart';

class AboutTabbedAppBar extends StatelessWidget {

  final List<dynamic> choices;
  const AboutTabbedAppBar({Key key, this.choices}) : super(key: key);


  @override
  Widget build(BuildContext context) {
          return DefaultTabController(
              length: this.choices.length,
              child: Scaffold(
                appBar: AppBar(
                    title: const Text('About Learning Compass'),
                    bottom: TabBar( isScrollable: true,
                        tabs: _convertJsonToListOfChoiceTabBars(this.choices))
                ),
                body: TabBarView(children: _convertJsonToListOfChoiceViews(this.choices)  ,

              )));

  }




  List<Widget> _convertJsonToListOfChoiceTabBars(List<dynamic> json) {
    List<Widget> newList = new List<Widget>();

    json.forEach((element) {
      newList.add(Tab(text: element['title'],
      ));
    });

    return newList;
  }


  List<Widget> _convertJsonToListOfChoiceViews(List<dynamic> json) {
    List<Widget> choiceList = new List<Widget>();

    json.forEach((element) {
      choiceList.add(Padding(
        padding: const EdgeInsets.all(16.0),
        child: AboutTabBarViewChoice(choice: element),
      ));
    });

    return choiceList;
  }

}