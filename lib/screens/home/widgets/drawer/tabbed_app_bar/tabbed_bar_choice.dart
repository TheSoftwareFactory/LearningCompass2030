import 'package:flutter/material.dart';


class ChoiceWidget extends StatelessWidget {
  const ChoiceWidget({Key key, this.choice}) : super(key: key);
  final Map<String, dynamic> choice;


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[ Text(choice['title']),

      ],

    );

  }
}