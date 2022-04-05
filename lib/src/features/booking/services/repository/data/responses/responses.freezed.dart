// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OfficePlaceResponse _$OfficePlaceResponseFromJson(Map<String, dynamic> json) {
  return _OfficePlaceResponse.fromJson(json);
}

/// @nodoc
class _$OfficePlaceResponseTearOff {
  const _$OfficePlaceResponseTearOff();

  _OfficePlaceResponse call({required int id, required bool available}) {
    return _OfficePlaceResponse(
      id: id,
      available: available,
    );
  }

  OfficePlaceResponse fromJson(Map<String, Object?> json) {
    return OfficePlaceResponse.fromJson(json);
  }
}

/// @nodoc
const $OfficePlaceResponse = _$OfficePlaceResponseTearOff();

/// @nodoc
mixin _$OfficePlaceResponse {
  int get id => throw _privateConstructorUsedError;
  bool get available => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficePlaceResponseCopyWith<OfficePlaceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficePlaceResponseCopyWith<$Res> {
  factory $OfficePlaceResponseCopyWith(
          OfficePlaceResponse value, $Res Function(OfficePlaceResponse) then) =
      _$OfficePlaceResponseCopyWithImpl<$Res>;
  $Res call({int id, bool available});
}

/// @nodoc
class _$OfficePlaceResponseCopyWithImpl<$Res>
    implements $OfficePlaceResponseCopyWith<$Res> {
  _$OfficePlaceResponseCopyWithImpl(this._value, this._then);

  final OfficePlaceResponse _value;
  // ignore: unused_field
  final $Res Function(OfficePlaceResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? available = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      available: available == freezed
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$OfficePlaceResponseCopyWith<$Res>
    implements $OfficePlaceResponseCopyWith<$Res> {
  factory _$OfficePlaceResponseCopyWith(_OfficePlaceResponse value,
          $Res Function(_OfficePlaceResponse) then) =
      __$OfficePlaceResponseCopyWithImpl<$Res>;
  @override
  $Res call({int id, bool available});
}

/// @nodoc
class __$OfficePlaceResponseCopyWithImpl<$Res>
    extends _$OfficePlaceResponseCopyWithImpl<$Res>
    implements _$OfficePlaceResponseCopyWith<$Res> {
  __$OfficePlaceResponseCopyWithImpl(
      _OfficePlaceResponse _value, $Res Function(_OfficePlaceResponse) _then)
      : super(_value, (v) => _then(v as _OfficePlaceResponse));

  @override
  _OfficePlaceResponse get _value => super._value as _OfficePlaceResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? available = freezed,
  }) {
    return _then(_OfficePlaceResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      available: available == freezed
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OfficePlaceResponse
    with DiagnosticableTreeMixin
    implements _OfficePlaceResponse {
  const _$_OfficePlaceResponse({required this.id, required this.available});

  factory _$_OfficePlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$$_OfficePlaceResponseFromJson(json);

  @override
  final int id;
  @override
  final bool available;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfficePlaceResponse(id: $id, available: $available)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OfficePlaceResponse'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('available', available));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OfficePlaceResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.available, available));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(available));

  @JsonKey(ignore: true)
  @override
  _$OfficePlaceResponseCopyWith<_OfficePlaceResponse> get copyWith =>
      __$OfficePlaceResponseCopyWithImpl<_OfficePlaceResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OfficePlaceResponseToJson(this);
  }
}

abstract class _OfficePlaceResponse implements OfficePlaceResponse {
  const factory _OfficePlaceResponse(
      {required int id, required bool available}) = _$_OfficePlaceResponse;

  factory _OfficePlaceResponse.fromJson(Map<String, dynamic> json) =
      _$_OfficePlaceResponse.fromJson;

  @override
  int get id;
  @override
  bool get available;
  @override
  @JsonKey(ignore: true)
  _$OfficePlaceResponseCopyWith<_OfficePlaceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

OfficeResponse _$OfficeResponseFromJson(Map<String, dynamic> json) {
  return _OfficeResponse.fromJson(json);
}

/// @nodoc
class _$OfficeResponseTearOff {
  const _$OfficeResponseTearOff();

  _OfficeResponse call(
      {required int id,
      required String name,
      required List<OfficePlaceResponse> places}) {
    return _OfficeResponse(
      id: id,
      name: name,
      places: places,
    );
  }

  OfficeResponse fromJson(Map<String, Object?> json) {
    return OfficeResponse.fromJson(json);
  }
}

/// @nodoc
const $OfficeResponse = _$OfficeResponseTearOff();

/// @nodoc
mixin _$OfficeResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<OfficePlaceResponse> get places => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficeResponseCopyWith<OfficeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficeResponseCopyWith<$Res> {
  factory $OfficeResponseCopyWith(
          OfficeResponse value, $Res Function(OfficeResponse) then) =
      _$OfficeResponseCopyWithImpl<$Res>;
  $Res call({int id, String name, List<OfficePlaceResponse> places});
}

/// @nodoc
class _$OfficeResponseCopyWithImpl<$Res>
    implements $OfficeResponseCopyWith<$Res> {
  _$OfficeResponseCopyWithImpl(this._value, this._then);

  final OfficeResponse _value;
  // ignore: unused_field
  final $Res Function(OfficeResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? places = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      places: places == freezed
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<OfficePlaceResponse>,
    ));
  }
}

/// @nodoc
abstract class _$OfficeResponseCopyWith<$Res>
    implements $OfficeResponseCopyWith<$Res> {
  factory _$OfficeResponseCopyWith(
          _OfficeResponse value, $Res Function(_OfficeResponse) then) =
      __$OfficeResponseCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, List<OfficePlaceResponse> places});
}

/// @nodoc
class __$OfficeResponseCopyWithImpl<$Res>
    extends _$OfficeResponseCopyWithImpl<$Res>
    implements _$OfficeResponseCopyWith<$Res> {
  __$OfficeResponseCopyWithImpl(
      _OfficeResponse _value, $Res Function(_OfficeResponse) _then)
      : super(_value, (v) => _then(v as _OfficeResponse));

  @override
  _OfficeResponse get _value => super._value as _OfficeResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? places = freezed,
  }) {
    return _then(_OfficeResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      places: places == freezed
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<OfficePlaceResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OfficeResponse
    with DiagnosticableTreeMixin
    implements _OfficeResponse {
  const _$_OfficeResponse(
      {required this.id, required this.name, required this.places});

  factory _$_OfficeResponse.fromJson(Map<String, dynamic> json) =>
      _$$_OfficeResponseFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final List<OfficePlaceResponse> places;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfficeResponse(id: $id, name: $name, places: $places)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OfficeResponse'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('places', places));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OfficeResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.places, places));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(places));

  @JsonKey(ignore: true)
  @override
  _$OfficeResponseCopyWith<_OfficeResponse> get copyWith =>
      __$OfficeResponseCopyWithImpl<_OfficeResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OfficeResponseToJson(this);
  }
}

abstract class _OfficeResponse implements OfficeResponse {
  const factory _OfficeResponse(
      {required int id,
      required String name,
      required List<OfficePlaceResponse> places}) = _$_OfficeResponse;

  factory _OfficeResponse.fromJson(Map<String, dynamic> json) =
      _$_OfficeResponse.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  List<OfficePlaceResponse> get places;
  @override
  @JsonKey(ignore: true)
  _$OfficeResponseCopyWith<_OfficeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
