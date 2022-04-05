// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OfficePlaceResponse _$$_OfficePlaceResponseFromJson(
        Map<String, dynamic> json) =>
    _$_OfficePlaceResponse(
      id: json['id'] as int,
      available: json['available'] as bool,
    );

Map<String, dynamic> _$$_OfficePlaceResponseToJson(
        _$_OfficePlaceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'available': instance.available,
    };

_$_OfficeResponse _$$_OfficeResponseFromJson(Map<String, dynamic> json) =>
    _$_OfficeResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      places: (json['places'] as List<dynamic>)
          .map((e) => OfficePlaceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OfficeResponseToJson(_$_OfficeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'places': instance.places,
    };
