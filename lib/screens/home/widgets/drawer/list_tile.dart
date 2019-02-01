import 'package:flutter/material.dart';

class MListTile extends StatelessWidget {

  final String title;
  final IconData icon;

  //Default values
  static const defaultListTileIcon = Icons.lightbulb_outline;
  static const defaultTitleText = 'about';

  MListTile({this.title= defaultTitleText,
    this.icon= Icons.lightbulb_outline});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading: new Icon(this.icon ),
      title: Text(this.title),);

  }

}
