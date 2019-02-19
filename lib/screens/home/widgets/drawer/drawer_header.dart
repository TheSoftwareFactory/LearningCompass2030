import 'package:flutter/material.dart';


class MenuDrawerHeader extends StatelessWidget {

  final String name;
  final String email;
  final CircleAvatar photo;

  //Default values
  static const _defaultName = 'Firstname Lastename';
  static const _defaultEmail= 'firstname.lastname@example.com';
  static const CircleAvatar _defaultPhoto = const CircleAvatar();

  MenuDrawerHeader({this.name = _defaultName, this.email= _defaultEmail,
    this.photo = _defaultPhoto});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(accountName: Text(this.name),
      accountEmail: Text(this.email),
      currentAccountPicture: this.photo,
    );
  }

}
