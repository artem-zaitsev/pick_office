import 'package:pick_office/src/features/booking/domain/office.dart';
import 'package:pick_office/src/features/booking/services/repository/office_repository.dart';

/// Сервис для работы с офисами
/// 
/// В терминах Clean Architecture: ближе всего Interactor
class OfficeService {
  final OfficeRepository _officeRepository;

  OfficeService(this._officeRepository);

  /// Список офисов
  Future<List<Office>> getOffices() async {
    return _officeRepository.getOffices();
  }

  /// Детали конкретного офиса
  Future<Office> getOfficeDetails(int id) async {
    return _officeRepository.getOfficeDetails(id);
  }
}
