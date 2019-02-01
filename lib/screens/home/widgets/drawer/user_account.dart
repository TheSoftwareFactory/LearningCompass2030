import 'package:flutter/material.dart';

class UserAccount {
  final Text name;
  final Text email;
  final CircleAvatar photo;

  //Default values
  static const defaultPhotoText = Text('defaultText',
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(fontWeight: FontWeight.bold),
  );
  static const CircleAvatar defaultPhoto = const CircleAvatar();

  UserAccount ({this.name = defaultPhotoText, this.email= defaultPhotoText,
                this.photo = defaultPhoto});
}