import 'package:flutter/material.dart';

class  AboutAppBar extends StatelessWidget{

  const AboutAppBar({Key key, this.choices}) : super(key: key);
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
    // About TabBars
    return AppBar(
      title: const Text('About Learning Compass'),
      bottom:  TabBar(tabs: _convertJsonToListOfChoiceTabBars(choices), isScrollable: true,),
    );
  }



