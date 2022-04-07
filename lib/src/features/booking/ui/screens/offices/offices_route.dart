import 'package:flutter/material.dart';
import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/di/di.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_screen.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_vm.dart';

class OfficesRoute extends MaterialPageRoute<void> {
  static const routeName = 'offices';
  OfficesRoute()
      : super(
          builder: (context) => const OfficesScreen(
            vm: createVm,
          ),
        );
}

OfficesVm createVm(BuildContext context) {
  return OfficesVm(
    Di.i.officeService,
    context,
    errorHandler: ErrorHandler(context),
  );
}
