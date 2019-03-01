import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_compass_exp/screens/home/widgets/drawer/tabbed_app_bar/tabbed_bar_choice.dart';

class AboutTabbedAppBar extends StatelessWidget {


  List<Widget> _convertJsonToWidget(List<dynamic> json) {
    List<Widget> newList = new List<Widget>();

    json.forEach((element) {
      newList.add(Padding(
        padding: const EdgeInsets.all(16.0),
        child: ChoiceWidget(choice: element),
      ));
    });

    return newList;
  }

  List<Widget> _convertJsonToTabTab(List<dynamic> json) {
    List<Widget> newList = new List<Widget>();

    json.forEach((element) {
      newList.add(Tab(text: element['title'],
      ));
    });

    return newList;
  }

  static final _choicesJson = 'assets/static_data/choices.json';
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString(_choicesJson),
      builder: (context, snapshot){
        if (snapshot.hasData) {
         var  _choices = json.decode(snapshot.data)['choices'];
         print(_choices);

          return  DefaultTabController(
            length: _choices.length,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('About Learning Compass'),
                bottom: TabBar(
                  isScrollable: true,
                  tabs: _convertJsonToTabTab(_choices),
                ),
              ),
              body: TabBarView(
                children: _convertJsonToWidget(_choices),
              ),
            ),
          );






        }
        return Center(
          child: Text("adsfadsfadsf"),
        );
      }

    );

  }

}