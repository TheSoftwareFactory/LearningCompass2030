import 'package:flutter/material.dart';


class MDrawerHeader extends StatelessWidget {

  final String name;
  final String email;
  final CircleAvatar photo;

  //Default values
  static const defaultPhotoText = 'defaultText';
  static const CircleAvatar defaultPhoto = const CircleAvatar();

  MDrawerHeader({this.name = defaultPhotoText, this.email= defaultPhotoText,
    this.photo = defaultPhoto});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(accountName: Text(this.name),
      accountEmail: Text(this.email),
      currentAccountPicture: this.photo,
    );
  }

}