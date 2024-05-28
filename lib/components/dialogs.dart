import 'package:flutter/material.dart';

class Dialogs {
  static void showSnackBar(BuildContext context, String message,
      {String title = 'Info', Duration duration = const Duration(seconds: 3)}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
      ),
    );
  }

  static void showProgressBar(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void hideProgressBar(BuildContext context) {
    Navigator.of(context).pop();
  }
}



// // Show progress bar
// Dialogs.showProgressBar(context);

// // Hide progress bar
// Dialogs.hideProgressBar(context);

// // Show snackbar
// Dialogs.showSnackBar(context, 'Your message');
