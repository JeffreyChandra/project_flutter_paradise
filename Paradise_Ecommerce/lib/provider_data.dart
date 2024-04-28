import 'package:flutter/material.dart';

class Account {
  int id;
  String name;
  String profilePictureUrl;
  String email;
  String password;

  Account({
    this.id = 0,
    this.name = '',
    this.profilePictureUrl = '',
    this.email = '',
    this.password = '',
  });
}

class ProfileProvider extends ChangeNotifier{
  List<Account> account = [];

  void addAccount(Account a){
    a.id = account.length;
    account.add(a);
    notifyListeners();
  }

  void changeName(int id, String name){
    for (var a in account) {
      if (a.id == id) {
        a.name = name;
        break;
      }
    }
    notifyListeners();
  }

  void changePassword(int id, String oldPass, String newPass){
    for (var a in account) {
      if (a.id == id) {
        if (a.password == oldPass) {
          a.password = newPass;
          break;
        }
      }
    }
    notifyListeners();
  }


}
