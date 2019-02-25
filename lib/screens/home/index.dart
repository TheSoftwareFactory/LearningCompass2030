import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/scheduler.dart';

import 'package:learning_compass_exp/screens/home/home.dart';
import 'package:learning_compass_exp/screens/home/widgets/incrementer_button.dart';
import 'package:learning_compass_exp/screens/home/widgets/drawer/drawer.dart';
import 'package:learning_compass_exp/screens/home/welcome_dialog.dart';

import 'package:learning_compass_exp/store/app_state.dart';
import 'package:learning_compass_exp/store/actions/actions.dart';


// Had to change this widget into stateful because I couldn't figure out a good
// way to add the welcome dialog check only to home screen and without side-effects
// Having the `showDialog` function call in build method makes it be called
// on every build, including changing orientation and push a route on top.
// This 'StatefulWidget' still has no actual state outside of the redux store, it's
// only used for the initState() function.
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!StoreProvider.of<AppState>(context).state.firstStartUp) return;
      await showDialog(
          context: context,
          builder: (context) {
            return WelcomeDialog();
          });
      StoreProvider.of<AppState>(context).dispatch(FirstStartUpDoneAction());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // May separate this into it's own file as well if it gets big
        title: Text('Learning Compass'),
      ),
      body: Home(),
      drawer: MenuDrawer(),
      floatingActionButton: IncrementerButton(),
    );
  }
}