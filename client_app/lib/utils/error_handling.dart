import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'utils.dart';

class ErrorHandling {

  /// Return True if Error is found and show SnackBar, 
  /// else return False.
  static bool httpErrorHandling({
    required http.Response response,
    required BuildContext context,
  }) {
    
    switch (response.statusCode) {
      case 200:
        return false;
      case 400:
        Utils.showSnackBar(context, jsonDecode(response.body)['detail']);
        return true;
      case 401:
        Utils.showSnackBar(context, jsonDecode(response.body)['detail']);
        return true;
      case 404:
        Utils.showSnackBar(context, jsonDecode(response.body)['detail']);
        return true;
      default:
        // Other possible Error
        Utils.showSnackBar(context, jsonDecode(response.body));
        return true;
    }
  }
}
