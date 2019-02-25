import 'package:flutter/material.dart';


class ChoiceBody {
  const ChoiceBody(this.title, this.body);

  final String title;
  final String body;

}


class ChoiceBodyCard extends StatelessWidget {
  const ChoiceBodyCard({Key key, this.choiceBody}) : super(key: key);
  final  ChoiceBody choiceBody;


  @override
  Widget build(BuildContext context) {
    return Card(

      child: Column(
        children: <Widget>[

          ListTile(
            title: Text(choiceBody.title),
          ),

          Divider(),

          ListTile(
            title: Text(choiceBody.body),
          ),


        ],
      ),
    );

  }}
