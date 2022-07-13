import 'package:flutter/material.dart';
import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/features/main/ui/main_vm.dart';


MainVm createVm(
  BuildContext context,
) {
  return MainVm(
    errorHandler: ErrorHandler(context),
  );
}
