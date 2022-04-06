import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

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

  /// Отдает структуру офиса из свг в виде битов
  Future<Uint8List> getOfficeStructure() async {
    final byteData = await rootBundle.load('assets/data/structure.svg');

    return byteData.buffer.asUint8List();
  }
}
