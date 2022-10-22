import 'package:flutter/material.dart';

import 'package:client_app/models/models.dart';

class UserProvider extends ChangeNotifier {

  //* If [_user] is null, if not Signed-In
  User? _user;

  // UserProvider() {
  //   _user = User(
  //     username: '',
  //     email: '',
  //     token: '',
  //   );
  // }

  User? get user => _user;

  void setUserFromJson(String user) {
    // NOTE : JSON format, in dart is actually String data type
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
