import 'package:flutter/material.dart';

import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/screens/home/widgets/flower/icon_popup/progress_bar.dart';

class IconPopup extends StatelessWidget {
  final Petal petal;

  IconPopup({this.petal});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        height: 180,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: petal.color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: petal.color,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              spreadRadius: 2)
                        ],
                      ),
                      child: Icon(petal.icon, color: Colors.white),
                    ),
                  ),
                  Text('${petal.toString()}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Text('Your current progress'),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ProgressBar(
                petal: petal,
                // Progress should be retrieved from the state in the future
                progress: 0.7,
              ),
            ),
            RaisedButton(
              color: petal.color,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, petal.route);
              },
              child: Text(
                'Go to info page',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
