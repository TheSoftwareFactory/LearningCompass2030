import 'package:flutter/material.dart';

class MenuListTile extends StatelessWidget {

  final String title;
  final String route;
  final IconData icon;

  //Default values
  static const _defaultTitleText = 'about';
  static const _defaultRoute = '/drawer/about';
  static const _defaultListTileIcon = Icons.lightbulb_outline;

  MenuListTile({this.title = _defaultTitleText, this.route = _defaultRoute,
    this.icon = _defaultListTileIcon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(this.icon),
    title: Text(this.title),
    onTap: (){// Navigate to the a screen using a named route
    Navigator.pushNamed(context, this.route);},

    );
    }
  }


