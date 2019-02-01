import 'package:flutter/material.dart';
import 'package:learning_compass_exp/screens/home/widgets/drawer/drawer_header.dart';
import 'package:learning_compass_exp/screens/home/widgets/drawer/list_tile.dart';



class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: new ListView(
        padding: const EdgeInsets.only(top:0.0),
        children: <Widget>[
          MenuDrawerHeader(), MenuListTile(), MenuListTile(),  MenuListTile()
        ],
      ),
    );
  }


}

