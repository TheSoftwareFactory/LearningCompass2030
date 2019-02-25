import 'package:flutter/material.dart';
import 'package:learning_compass_exp/screens/home/widgets/drawer/tabbed_app_bar/tabbed_bar_choice_body.dart';

class Choice {
  const Choice({this.title, this.body});

  final String title;
  final List<ChoiceBody> body;
  //final Map body1;
  //final String videoLink;
}


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
                  children: choice.body.map((ChoiceBody choicesBody) {
                    return ChoiceBodyCard(choiceBody: choicesBody);
                  }).toList()
              )
            ]


        )
    );
  }
}