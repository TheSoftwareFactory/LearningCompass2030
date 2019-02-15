import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';


class WelcomeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
            height: 350.0,
            width: 200.0,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(height: 150.0),
                    Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          color: Colors.teal),
                    ),
                    Positioned(
                      top: 50.0,
                      left: 94.0,
                      child: Container(
                          height: 90.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45.0),
                            border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 2.0),
                          )),
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.all(10.0), child: Text("askjbasfdjk")),
                StoreConnector<AppState, VoidCallback>(
                  converter: (Store<AppState> store) => () => store.dispatch(FirstStartUpDoneAction()),
                  builder: (BuildContext context, VoidCallback callback) {
                    return FlatButton(
                        child: Text('OKAY'),
                        onPressed: () {
                          callback();
                          Navigator.of(context).pop();
                        },
                        color: Colors.green
                    );
                  },
                ),

              ],
            )));
  }
}
