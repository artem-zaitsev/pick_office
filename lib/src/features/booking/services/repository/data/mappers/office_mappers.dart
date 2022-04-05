import 'package:pick_office/src/features/booking/domain/office.dart';
import 'package:pick_office/src/features/booking/domain/office_place.dart';
import 'package:pick_office/src/features/booking/services/repository/data/responses/responses.dart';

abstract class OfficeMappers {
  static Office mapOfficeResponse(OfficeResponse data) {
    return Office(
      id: data.id,
      name: data.name,
      places: data.places
          .map(
            mapOfficePlaceResponse,
          )
          .toList(),
    );
  }

  static OfficePlace mapOfficePlaceResponse(OfficePlaceResponse data) {
    return OfficePlace(
      id: data.id,
      available: data.available,
    );
  }
}
