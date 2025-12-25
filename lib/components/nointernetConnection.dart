import 'package:flutter/material.dart';
import 'package:indian_talent_olympiad/app_state.dart';

void _showNoInternetDialog(BuildContext? context) {
  if (context == null) return;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        title: const Text('No Internet'),
        content: const Text(
          'Please check your internet connection and try again.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              FFAppState().update(() {
                FFAppState().hasShownNoInternetPopup = false;
              });
              Navigator.pop(context);
            },
            child: const Text('Retry'),
          ),
        ],
      );
    },
  );
}
