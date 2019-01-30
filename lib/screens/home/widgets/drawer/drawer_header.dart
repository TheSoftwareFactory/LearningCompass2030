import 'package:flutter/material.dart';
import 'package:learning_compass_exp/user_account.dart';


class MDrawerHeader {



}

class MDrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    UserAccount myAccount ;
    return UserAccountsDrawerHeader(accountName: myAccount.name,
        accountEmail: myAccount.email,
        currentAccountPicture: myAccount.photo,
        decoration: BoxDecoration(color: Colors.blueAccent) , );
}

}