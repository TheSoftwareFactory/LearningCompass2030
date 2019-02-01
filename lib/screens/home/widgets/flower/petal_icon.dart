import 'package:flutter/material.dart';

import 'package:learning_compass_exp/common/widgets/custom_icon_button.dart';

class PetalIcon extends StatelessWidget {
  final Color color;

  PetalIcon({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: CustomIconButton(
          color: Colors.white,
          icon: Icon(Icons.store),
          onPressed: () => print('third'),
        ),
    );
  }
}
