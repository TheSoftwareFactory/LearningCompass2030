import 'package:flutter/material.dart';

import 'package:learning_compass_exp/common/widgets/custom_icon_button.dart';
import 'package:learning_compass_exp/data/models/petal.dart';
import 'package:learning_compass_exp/common/widgets/flower/icon_popup/icon_popup.dart';

class PetalIconButton extends StatelessWidget {
  final Petal petal;

  PetalIconButton({@required this.petal});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: petal.color,
        shape: BoxShape.circle,
      ),
      child: CustomIconButton(
          color: Colors.white,
          icon: Icon(petal.icon),
          onPressed: () {
            showDialog(
                context: context, builder: (_) => IconPopup(petal: petal));
          }),
    );
  }
}
