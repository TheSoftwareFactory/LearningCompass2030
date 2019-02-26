import 'package:flutter/material.dart';



class ChoiceBodyCard extends StatelessWidget {
  const ChoiceBodyCard({Key key, this.choiceBody}) : super(key: key);
  final Map<String, String> choiceBody;


  @override
  Widget build(BuildContext context) {
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
