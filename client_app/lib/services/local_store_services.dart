import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import '../utils/utils.dart';
import '../constants.dart';

class LocalStoreServices {

  /// Save token data into local storage,
  /// Success : return True,
  /// Fail : return False
  static Future<bool> saveInLocal(BuildContext context, User userData) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      return await pref.setString(Constants.LOCAL_STORAGE_TOKEN_KEY, userData.token);
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
      return false;
    }
  }

  /// Remove token data from local storage,
  /// Success : return True,
  /// Fail : return False
  static Future<bool> removeFromLocal(BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      return await pref.remove(Constants.LOCAL_STORAGE_TOKEN_KEY);
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
      return false;
    }
  }
}