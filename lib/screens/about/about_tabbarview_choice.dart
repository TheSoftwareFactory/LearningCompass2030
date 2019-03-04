import 'package:flutter/material.dart';


class AboutTabBarViewChoice extends StatelessWidget {
  const AboutTabBarViewChoice({Key key, this.choice}) : super(key: key);
  final Map<String, dynamic> choice;


  @override
  Widget build(BuildContext context) {
    // About TabBarView Choice Widget
    return ListView(
      children: <Widget>[
        Text(choice['title'],




        ),

      ],

    );

  }
}
