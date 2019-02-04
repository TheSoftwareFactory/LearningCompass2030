import 'package:flutter/material.dart';

class MenuListTile extends StatelessWidget {

  final String title;
  final IconData icon;

  //Default values
  static const defaultListTileIcon = Icons.lightbulb_outline;
  static const defaultTitleText = 'about';

  MenuListTile({this.title= defaultTitleText,
    this.icon= Icons.lightbulb_outline});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading:Icon(this.icon ),
      title: Text(this.title),);

  }

}
