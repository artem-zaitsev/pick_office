import 'package:flutter/material.dart';
import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/core/ui/models/entity_state.dart';
import 'package:pick_office/src/core/ui/vm/view_model.dart';
import 'package:pick_office/src/features/booking/domain/office.dart';
import 'package:pick_office/src/features/booking/domain/office_place.dart';
import 'package:pick_office/src/features/booking/services/office_service.dart';

class SelectPlaceVm extends ViewModel {
  final BuildContext _context;
  final OfficeService _officeService;
  final int _officeId;

  EntityState<Office> office = EntityState.loading();

  OfficePlace? chosenPlace;

  SelectPlaceVm(
    this._context,
    this._officeService,
    this._officeId, {
    required ErrorHandler errorHandler,
  }) : super(errorHandler: errorHandler);


  @override
  void onInit() {
    super.onInit();

    safe(
      () async {
        final data = await _officeService.getOfficeDetails(_officeId);
        office = EntityState.data(data);

        notifyListeners();
      },
      onError: (e) {
        office = EntityState.error(data: office.data);

        notifyListeners();
      },
    );
  }

  void accept() {}
  
  void pop() {
    Navigator.of(_context).pop();
  }
}
