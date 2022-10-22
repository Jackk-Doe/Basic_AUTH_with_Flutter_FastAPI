import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'utils.dart';

class ErrorHandling {

  static void httpErrorHandling({
    required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess,
  }) {
    switch (response.statusCode) {
      case 200:
        onSuccess();
        break;
      case 400:
        Utils.showSnackBar(context, jsonDecode(response.body)['detail']);
        break;
      case 401:
        Utils.showSnackBar(context, jsonDecode(response.body)['detail']);
        break;
      case 404:
        Utils.showSnackBar(context, jsonDecode(response.body)['detail']);
        break;
      default:
        // Other possible Error
        Utils.showSnackBar(context, jsonDecode(response.body));
        
    }
  }
}
