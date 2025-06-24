import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class ToastMessage {
  static void success(BuildContext context, String message) {
    _show(context, message, Colors.green, Icons.check_circle);
  }

  static void error(BuildContext context, String message) {
    _show(context, message, Colors.red, Icons.error);
  }

  static void _show(BuildContext context, String message, Color color, IconData icon) {
    Flushbar(
      margin: const EdgeInsets.all(12),
      borderRadius: BorderRadius.circular(8),
      backgroundColor: color,
      icon: Icon(icon, color: Colors.white),
      duration: const Duration(seconds: 2),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    ).show(context);
  }
}
