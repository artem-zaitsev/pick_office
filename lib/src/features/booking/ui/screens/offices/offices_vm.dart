import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/core/ui/models/entity_state.dart';
import 'package:pick_office/src/core/ui/vm/view_model.dart';
import 'package:pick_office/src/features/booking/domain/office.dart';
import 'package:pick_office/src/features/booking/services/office_service.dart';

class OfficesVm extends ViewModel {
  final OfficeService _officeService;

  EntityState<List<Office>> office = EntityState.loading();

  OfficesVm(
    this._officeService, {
    required ErrorHandler errorHandler,
  }) : super(errorHandler: errorHandler);

  @override
  void onInit() {
    super.onInit();

    safe(
      () async {
        final officeList = await _officeService.getOffices();

        office = EntityState.data(officeList);
        notifyListeners();
      },
    );
  }
}
