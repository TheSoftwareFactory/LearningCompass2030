import 'package:flutter/material.dart';
import 'package:learning_compass_exp/screens/about/about_tabbarview_choice.dart';



class  AboutTabBarView extends StatelessWidget{

  const AboutTabBarView({Key key, @required this.choices}) : super(key: key);
  final List<dynamic> choices;

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

  @override
  Widget build(BuildContext context) {
    //returns  About TabBarViews
    return TabBarView(children: _convertJsonToListOfChoiceViews(choices) );
  }













}





