// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_booking.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBookingAdapter extends TypeAdapter<HiveBooking> {
  @override
  final int typeId = 1;

  @override
  HiveBooking read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBooking(
      fields[0] as int,
      fields[1] as DateTime,
      fields[2] as String,
      fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveBooking obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.officeName)
      ..writeByte(3)
      ..write(obj.placeId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBookingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
