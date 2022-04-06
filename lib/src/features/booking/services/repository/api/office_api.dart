import 'dart:convert' as json;
import 'package:flutter/services.dart' show rootBundle;
import 'package:pick_office/src/features/booking/services/repository/data/responses/responses.dart';

/// Источник данных для офиса
/// 
/// Тестовая реализация - источник данных локальный файл
class OfficeApi {
  /// Список офисов
  Future<List<OfficeResponse>> getOffices() async {
    final data = await rootBundle.loadString('assets/data/office.json');
    final office =
        OfficeResponse.fromJson(json.jsonDecode(data) as Map<String, dynamic>);

    return [office];
  }

  /// Детали конкретного офиса
  /// 
  /// Здесь захардкоженная реализация поиска в списке
  Future<OfficeResponse> getOfficeDetails(int id) async {
    final offices = await getOffices();

    return offices.where((element) => element.id == id).first;
  }
}
