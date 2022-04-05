import 'package:flutter/material.dart';
import 'package:pick_office/src/core/ui/handlers/error_handler.dart';

abstract class ViewModel extends ChangeNotifier {
  final ErrorHandler _errorHandler;

  ViewModel({
    required ErrorHandler errorHandler,
  }) : _errorHandler = errorHandler;

  /// Колбек на initState
  void onInit() {
    debugPrint('init $this');
  }

  /// Колбек на dispose
  void onDispose() {
    debugPrint('dispose $this');
  }

  /// Безопасный вызов кода
  void safe(void Function() call) {
    try {
      call();
    } on Object catch (e) {
      handleError(e);
    }
  }

  void handleError(Object e) {
    _errorHandler.handleError(e);
  }
}
