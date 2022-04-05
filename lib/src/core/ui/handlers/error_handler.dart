import 'package:flutter/material.dart';

/// Перехватчик ошибок, который показывает их через снек
class ErrorHandler {
  final BuildContext context;

  ErrorHandler(this.context);

  void handleError(Object e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          e.toString(),
        ),
      ),
    );
  }
}
