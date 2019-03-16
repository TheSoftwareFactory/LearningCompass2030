import 'package:flutter/material.dart';
import 'package:learning_compass_exp/screens/about/about_screen_tabbarview_body.dart';


class AboutScreenTabBarView extends StatelessWidget {
  const AboutScreenTabBarView({Key key, this.choice}) : super(key: key);
  final Map <String, dynamic> choice;


  @override
  Widget build(BuildContext context) {
    // About TabBarView Choice Widget
    return Container(

        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,

        decoration: _choiceDecorationImage(choice['title']),
        child: ListView(
            children: _jsonToChoiceBodyList(choice)
        ),

    );
  }


  List<Widget> _jsonToChoiceBodyList( Map<String, dynamic>json) {
    List<Widget> choiceBodyList = new List<Widget>();

    choiceBodyList.add(Container(
        padding: const EdgeInsets.all(12.0),

        decoration: new BoxDecoration(
            color: Colors.white70,
            borderRadius: new BorderRadius.all(Radius.circular(4.0))),

        child: Text(json['title'],
      textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold))));

    json['content'].forEach((element) {
      choiceBodyList.add(Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: AboutScreenTabBarViewBody(choiceBody: element),
      ));
    });

    return choiceBodyList;
     }




  _choiceDecorationImage(String choiceTitle) {


  return new BoxDecoration(
  image: new DecorationImage(
    fit: BoxFit.fill,
      image: new AssetImage('assets/images/about/'+choiceTitle.toLowerCase() +'.jpg'))
  );


  }

}
