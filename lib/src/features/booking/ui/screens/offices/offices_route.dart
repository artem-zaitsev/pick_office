import 'package:flutter/material.dart';
import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/features/booking/services/office_service.dart';
import 'package:pick_office/src/features/booking/services/repository/api/office_api.dart';
import 'package:pick_office/src/features/booking/services/repository/office_repository.dart';
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
    OfficeService(
      OfficeRepository(
        OfficeApi(),
      ),
    ),
    context,
    errorHandler: ErrorHandler(context),
  );
}
