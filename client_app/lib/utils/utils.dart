import 'package:flutter/material.dart';

/// General Utils helper-functions
class Utils {

  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }
}