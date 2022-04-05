import 'package:pick_office/src/features/booking/domain/office.dart';
import 'package:pick_office/src/features/booking/services/repository/api/office_api.dart';
import 'package:pick_office/src/features/booking/services/repository/data/mappers/office_mappers.dart';

/// Обертка над источником офисов
///
/// Ответственность:
/// - сокрытие источника
/// - маппинг сервисных моделей в доменные
class OfficeRepository {
  final OfficeApi _officeApi;

  OfficeRepository(this._officeApi);

  /// Список офисов
  Future<List<Office>> getOffices() async {
    final data = await _officeApi.getOffices();

    return data.map(OfficeMappers.mapOfficeResponse).toList();
  }

  /// Детали конкретного офиса
  Future<Office> getOfficeDetails(int id) async {
    final data = await _officeApi.getOfficeDetails(id);

    return OfficeMappers.mapOfficeResponse(data);
  }
}
