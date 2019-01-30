import 'package:flutter/material.dart';

import 'drawer_header.dart';
import 'list_tile.dart';



class MDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: new ListView(
        padding: const EdgeInsets.only(top:0.0),
        children: <Widget>[
          MDrawerHeaderWidget(), MListTileWidget()
        ],
      ),
    );
  }


}