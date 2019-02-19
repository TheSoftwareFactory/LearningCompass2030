import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/scheduler.dart';

import 'package:learning_compass_exp/screens/home/home.dart';
import 'package:learning_compass_exp/screens/home/widgets/incrementer_button.dart';
import 'package:learning_compass_exp/screens/home/widgets/drawer/drawer.dart';
import 'package:learning_compass_exp/screens/home/welcome_dialog.dart';

import 'package:learning_compass_exp/store/app_state.dart';

// This Widget defines the root of the Home-screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!StoreProvider.of<AppState>(context).state.firstStartUp) return _;
      return showDialog(
          context: context,
          builder: (context) {
            return WelcomeDialog();
          });
    });


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
