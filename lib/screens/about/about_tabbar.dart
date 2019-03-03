import 'package:flutter/material.dart';

class  AboutTabBar extends StatelessWidget{

  const AboutTabBar({Key key, this.choices}) : super(key: key);
  final List<dynamic> choices;

  List<Widget> _convertJsonToListOfChoiceTabBars(List<dynamic> json) {
    List<Widget> newList = new List<Widget>();

    json.forEach((element) {
      newList.add(Tab(text: element['title'],
      ));
    });

    return newList;
  }

  @override
  Widget build(BuildContext context) {
    // About TabBarView Widget
    return TabBarView(children: _convertJsonToListOfChoiceTabBars(choices) );
  }













}





