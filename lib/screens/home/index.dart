import 'package:flutter/material.dart';

import 'package:learning_compass_exp/screens/home/home.dart';
import 'package:learning_compass_exp/screens/home/widgets/incrementer_button.dart';

import 'widgets/drawer/drawer.dart';


// This Widget defines the root of the Home-screen
class HomeScreen extends StatelessWidget {

  final MDrawerWidget drawer = new MDrawerWidget() ;
  //Drawer drawer = new Drawer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // May separate this into it's own file as well if it gets big
        title: Text('Learning Compass'),
        //leading: Icon(Icons.menu),
      ),
      body: Home(),
      drawer: drawer,
      floatingActionButton: IncrementerButton(),

    );
  }
}