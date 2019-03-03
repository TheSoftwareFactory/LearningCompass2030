import 'package:flutter/material.dart';



class AboutTabBarViewChoiceBody extends StatelessWidget {
  const AboutTabBarViewChoiceBody({Key key, this.choiceBody}) : super(key: key);
  final Map<String, String> choiceBody;


  @override
  Widget build(BuildContext context) {
    // About About TabBarView Choice Body Widget
    return Card(

      child: Column(
        children: <Widget>[

          ListTile(
            title: Text(choiceBody['title']),
          ),

          Divider(),

          ListTile(
              title: Text(choiceBody['body'])),

        ],
      ),
    );

  }}