import 'package:flutter/material.dart';

import 'package:learning_compass_exp/common/widgets/custom_icon_button.dart';

class PetalIconButton extends StatelessWidget {
  final Color color;
  final IconData icon;

  PetalIconButton({this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: CustomIconButton(
          color: Colors.white,
          icon: Icon(icon),
          onPressed: () => print('third'),
        ),
    );
  }
}
