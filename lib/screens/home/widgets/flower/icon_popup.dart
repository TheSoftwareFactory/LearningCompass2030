import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal.dart';

class IconPopup extends StatelessWidget {
  final Petal petal;

  IconPopup({this.petal});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        width: 100,
        height: 200,
        child: Column(
          children: <Widget>[
            Container(
              //color: Colors.blue,
              decoration: BoxDecoration(
                color: petal.color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: petal.color,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 2)],
                        ),
                        child: Icon(petal.icon, color: Colors.white),
                      ),
                    ),
                    Text('${petal.toString()}', style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600)),
                  ]
                )
              )
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('Add progress bar here'),
            ),
            RaisedButton(
              color: petal.color,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, petal.route);
              },
              child: Text('Go to info page', style: TextStyle(color: Colors.white),),
            ),
      ],
        )
    ));
  }
}