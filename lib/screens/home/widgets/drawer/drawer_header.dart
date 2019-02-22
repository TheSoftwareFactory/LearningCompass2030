import 'package:flutter/material.dart';


class MenuDrawerHeader extends StatelessWidget {

  final String name;
  final String email;
  final CircleAvatar photo;

  //Default values
  static const _defaultPhotoText = 'defaultText';
  static const CircleAvatar _defaultPhoto = const CircleAvatar();

  MenuDrawerHeader({this.name = _defaultPhotoText, this.email= _defaultPhotoText,
    this.photo = _defaultPhoto});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(accountName: Text(this.name),
      accountEmail: Text(this.email),
      currentAccountPicture: this.photo,
    );
  }

}
