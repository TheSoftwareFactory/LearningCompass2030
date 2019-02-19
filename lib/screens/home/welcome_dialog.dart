import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';

class WelcomeDialog extends StatelessWidget {

  /// Builds the top of the Welcome dialog. Includes the green (cosmetic) bar
  /// and icon on the top.
  Widget _buildTop() {
    return Stack(
      children: <Widget>[
        Container(height: 100.0),
        Container(
          height: 70.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            color: Colors.green,
          ),
        ),
        Positioned(
          top: 30.0,
          left: 105,
          child: Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[100],
                image: DecorationImage(
                  image: AssetImage("assets/images/flower.png"),
                  fit: BoxFit.cover,
                ),
              )),
        )
      ],
    );
  }

  /// Builds the buttons on the bottom of the dialog. Contains two buttons:
  /// SKIP and TAKE A TOUR.
  Widget _buttonBar() {
    return StoreConnector<AppState, VoidCallback>(
        converter: (Store<AppState> store) =>
            () => store.dispatch(FirstStartUpDoneAction()),
        builder: (BuildContext context, VoidCallback callback) {
          return ButtonBar(
            mainAxisSize: MainAxisSize.min,
            alignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: Text('SKIP'),
                onPressed: () {
                  callback();
                  Navigator.of(context).pop();
                },
                color: Colors.transparent,
              ),
              FlatButton(
                child: Text('TAKE A TOUR'),
                onPressed: () {
                  callback();
                  Navigator.of(context).pop();
                },
                color: Colors.transparent,
              )
            ],
          );
        });
  }

  /// Builds the actual welcome message of the dialog. Includes a welcome
  /// header and a body of text. Uses a scrollable view.
  Widget _buildBody(BuildContext context) {
    return Container(
      height:
      MediaQuery.of(context).orientation == Orientation.portrait
          ? 180
          : 105,
      child: ListView(
        padding: EdgeInsets.only(left: 30, right: 30),
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Welcome to the Learning Compass 2030 app!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text('PLACEHOLDER TEXT!!! The Learning Compass 2030 app'
              ' is here to help you achieve a good and fulfilling '
              'life by providing you with valuable information.'),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
                'To familiarize yourself with the functionality of'
                    'the app you can TAKE A TOUR of the apps features'
                    'below. Alternatively if you like to explore for'
                    'yourself you can select SKIP'),

          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Container(
            height: 370.0,
            width: 200.0,
            child: Column(
              children: <Widget>[
                _buildTop(),
                _buildBody(context),
                _buttonBar(),
              ],
            )));
  }
}
