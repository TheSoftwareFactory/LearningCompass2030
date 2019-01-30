import 'package:flutter/material.dart';

import 'user_account.dart';



class MDrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    UserAccount myAccount = new UserAccount() ;
    return UserAccountsDrawerHeader(accountName: myAccount.name,
        accountEmail: myAccount.email,
        currentAccountPicture: myAccount.photo,
        //decoration: BoxDecoration(color: Colors.blueAccent) ,
    );
}

}