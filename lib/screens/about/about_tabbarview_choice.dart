import 'package:flutter/material.dart';
import 'package:learning_compass_exp/screens/about/about_tabbarview_choice_body.dart';


class AboutTabBarViewChoice extends StatelessWidget {
  const AboutTabBarViewChoice({Key key, this.choice}) : super(key: key);
  final Map <String, dynamic> choice;


  @override
  Widget build(BuildContext context) {
    // About TabBarView Choice Widget
    return ListView(
        children: _jsonToChoiceBodyList(choice)
    );

  }


  List<Widget> _jsonToChoiceBodyList( Map<String, dynamic>json) {
    List<Widget> choiceBodyList = new List<Widget>();

    choiceBodyList.add(Text(json['title']));

    json['content'].forEach((element) {
      choiceBodyList.add(Padding(
        padding: const EdgeInsets.all(16.0),
        child: AboutTabBarViewChoiceBody(choiceBody: element),
      ));
    });

    return choiceBodyList;
     }
}
