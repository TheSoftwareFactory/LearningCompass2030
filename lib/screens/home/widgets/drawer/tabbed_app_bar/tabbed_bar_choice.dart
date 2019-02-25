import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.videoLink, this.body1, this.body});

  final String title;
  final String videoLink;
  final List<ChoiceBody> body1;
  final Map body;
}

class ChoiceBody {
  const ChoiceBody({this.title, this.body});

  final String title;
  final String body;
}


//this will come from json
const List<Choice> choices = const <Choice>[
  const Choice(title: 'OECD', videoLink: 'link' ),
  const Choice(title: 'TRENDS' ),
  const Choice(title: 'FRAMEWORK',  ),
  const Choice(title: 'ANALYSIS',  ),
];


class ChoiceWidget extends StatelessWidget {
  const ChoiceWidget({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(

        children: <Widget>[
          Text(choice.title),
          ListView(
            children: <Widget>[

              Card()
            ],
          )],


      )
   );
  }
