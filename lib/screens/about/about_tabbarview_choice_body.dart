import 'package:flutter/material.dart';



class AboutTabBarViewChoiceBody extends StatelessWidget {
  const AboutTabBarViewChoiceBody({Key key, this.choiceBody}) : super(key: key);
  final Map<String, dynamic> choiceBody;


  @override
  Widget build(BuildContext context) {
    // About About TabBarView Choice Body Widget
    return Card(
       color: Colors.white70,
        child:  _choiceBody(choiceBody)


    );

  }

  _choiceBody( Map<String, dynamic> choiceBody ){

    if(choiceBody['title'] == '' ) {
      return  ListTile(
          title: Text(choiceBody['body'],), );
    }
    else {

      return Column(
          children: <Widget>[

            ListTile(
              title: Text(choiceBody['title'], textAlign: TextAlign.center),
            ),

            Divider(),

            ListTile(
                title: Text(choiceBody['body'])),]);

    }

  }


}


