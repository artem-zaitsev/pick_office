//ignore_for_file: prefer-match-file-name
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'responses.freezed.dart';
part 'responses.g.dart';

@freezed
class OfficePlaceResponse with _$OfficePlaceResponse {
  const factory OfficePlaceResponse({
    required int id,
    required bool available,
  }) = _OfficePlaceResponse;

  factory OfficePlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$OfficePlaceResponseFromJson(json);
}

@freezed
class OfficeResponse with _$OfficeResponse{
  const factory OfficeResponse(
    {
      required int id,
      required String name,
      required List<OfficePlaceResponse> places,
    }
  ) = _OfficeResponse;

  factory OfficeResponse.fromJson(Map<String, dynamic> json) => _$OfficeResponseFromJson(json);
}
