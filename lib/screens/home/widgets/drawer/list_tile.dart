import 'package:flutter/material.dart';

class MenuListTile extends StatelessWidget {

  final String title;
  final IconData icon;

  //Default values
  static const _defaultListTileIcon = Icons.lightbulb_outline;
  static const _defaultTitleText = 'about';

  MenuListTile({this.title= _defaultTitleText,
    this.icon= _defaultListTileIcon});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading:Icon(this.icon ),
      title: Text(this.title),);

  }

}
