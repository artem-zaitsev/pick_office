import 'package:pick_office/src/features/booking/services/office_service.dart';
import 'package:pick_office/src/features/booking/services/repository/api/office_api.dart';
import 'package:pick_office/src/features/booking/services/repository/office_repository.dart';

//ignore: prefer-correct-type-name
class Di {

  //ignore: prefer-correct-identifier-length
  static final i = Di._();

  late final officeRepository = OfficeRepository(officeApi);
  late final officeService = OfficeService(officeRepository);

  final officeApi = OfficeApi();

  Di._();
}
