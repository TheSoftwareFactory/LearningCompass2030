import 'package:flutter/material.dart';
import 'package:learning_compass_exp/screens/home/home.dart';
import 'package:learning_compass_exp/screens/home/widgets/incrementer_button.dart';
import 'package:learning_compass_exp/screens/home/widgets/drawer/drawer.dart';


// This Widget defines the root of the Home-screen
class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // May separate this into it's own file as well if it gets big
        title: Text('Learning Compass'),
        //leading: Icon(Icons.menu),
      ),
      body: Home(),
      drawer: MDrawer(),
      floatingActionButton: IncrementerButton(),

    );
  }
}