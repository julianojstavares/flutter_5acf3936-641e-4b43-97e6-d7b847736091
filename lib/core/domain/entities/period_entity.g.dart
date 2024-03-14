// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PeriodEntityAdapter extends TypeAdapter<PeriodEntity> {
  @override
  final int typeId = 1;

  @override
  PeriodEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PeriodEntity(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as DateTime,
      fields[4] as DateTime,
      fields[5] as String,
      fields[6] as int,
      fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PeriodEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userID)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.startDate)
      ..writeByte(4)
      ..write(obj.endDate)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.goal1)
      ..writeByte(7)
      ..write(obj.goal2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeriodEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
