import 'package:flutter/material.dart';

class MListTile{
  String title;
  IconData icon;
  MListTile(this.title, this.icon);

}


class MListTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
        title: Text("Item 2"),
    trailing: Icon(Icons.arrow_forward));
  }

}