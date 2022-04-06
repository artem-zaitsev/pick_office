import 'package:pick_office/src/features/booking/services/booking_service.dart';
import 'package:pick_office/src/features/booking/services/office_service.dart';
import 'package:pick_office/src/features/booking/services/repository/api/office_api.dart';
import 'package:pick_office/src/features/booking/services/repository/office_repository.dart';
import 'package:pick_office/src/features/booking/services/storage/booking_storage.dart';

//ignore: prefer-correct-type-name
class Di {
  //ignore: prefer-correct-identifier-length
  static final i = Di._();

  late final officeRepository = OfficeRepository(officeApi);
  late final officeService = OfficeService(officeRepository);
  late final bookingService = BookingService(bookingStorage);

  final officeApi = OfficeApi();
  final bookingStorage = BookingStorage();

  Di._();
}
