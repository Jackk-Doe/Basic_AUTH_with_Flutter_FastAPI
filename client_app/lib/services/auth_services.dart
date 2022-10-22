import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/models.dart';
import '../utils/error_handling.dart';
import '../utils/utils.dart';

class AuthService {

  /// A function for Sign-Up user account,
  /// Success : return User model,
  /// Fail : return null
  static Future<User?> signUpUser({
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

      bool hasError = ErrorHandling.httpErrorHandling(response: res, context: context);

      if (hasError) {
        /// Has HTTP Error
        return null;
      }

      /// Execute successfully
      return User.fromJson(res.body);

    } catch (e) {
      Utils.showSnackBar(context, e.toString());
      return null;
    }
  }
}
