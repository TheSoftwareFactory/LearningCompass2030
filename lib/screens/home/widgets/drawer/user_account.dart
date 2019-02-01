import 'package:flutter/material.dart';

class UserAccount {
  final Text name;                Text get userName =>  name;
  final Text email;               Text get userEmail => email;
  final CircleAvatar photo;       CircleAvatar get userPhoto => photo;

  //Default values
  static const defaultPhotoText = Text('defaultText',
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(fontWeight: FontWeight.bold),
  );
  static const CircleAvatar defaultPhoto = const CircleAvatar(
  backgroundColor: Colors.brown,);

  UserAccount ({this.name = defaultPhotoText, this.email= defaultPhotoText,
                this.photo = defaultPhoto});
}