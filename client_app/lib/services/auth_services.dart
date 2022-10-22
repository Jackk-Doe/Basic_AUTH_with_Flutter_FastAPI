import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/models.dart';
import '../utils/error_handling.dart';
import '../utils/utils.dart';

class AuthService {

  /// A function for Sign-Up User
  /// Plus backend-API connection
  static void signUpUser({
    required BuildContext context,
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      UserAuth userAuth = UserAuth(email, password, username: username);

      http.Response res = await http.post(
        Uri.parse("${Constants.URI}/users/signup"),
        body: userAuth.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      ErrorHandling.httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          // TODO : update when sign up success
          Utils.showSnackBar(context, 'User has sign-up successfully!!');
        },
      );
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
    }
  }
}
