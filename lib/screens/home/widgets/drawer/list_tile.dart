import 'package:flutter/material.dart';

class MListTileWidget extends StatelessWidget {

  final Text title;          Text get userTitle =>  title;
  final IconData icon;       IconData get listTileIcon => icon;

  //Default values
  static const defaultListTileIcon = Icons.lightbulb_outline;
  Text listTileTitle({String title = "about"})
  {return Text(title);
  }

  static const defaultTitleText = Text('about',
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(fontWeight: FontWeight.bold),
  );
  MListTileWidget({this.title= defaultTitleText,
                   this.icon= Icons.lightbulb_outline});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(

        leading: new Icon(defaultListTileIcon ),
        title: listTileTitle(),);

  }

}