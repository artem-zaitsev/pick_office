import 'package:flutter_test/flutter_test.dart';
import 'package:pick_office/src/features/booking/domain/office_place.dart';
import 'package:pick_office/src/features/booking/services/repository/data/mappers/office_mappers.dart';
import 'package:pick_office/src/features/booking/services/repository/data/responses/responses.dart';

void main() {
  group(
    'Тесты на маппинг сервисные -> доменные',
    () {
      test(
          'Если на вход подаем OfficePlaceResponse, получаем валидную  OfficePlace',
          () {
        final expected = OfficePlace(
          id: 1,
          available: false,
        );

        const input = OfficePlaceResponse(id: 1, available: false);

        final actual = OfficeMappers.mapOfficePlaceResponse(input);

        expect(
          actual.id == expected.id && actual.available == expected.available,
          true,
        );
      });
    },
  );
}
