// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memberships_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MembershipsTableAdapter extends TypeAdapter<MembershipsTable> {
  @override
  final int typeId = 0;

  @override
  MembershipsTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MembershipsTable(
      title: fields[1] as String,
      ownerName: fields[2] as String,
      ownerMobile: fields[3] as String,
      dateToExpair: fields[4] as String,
      id: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MembershipsTable obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.ownerName)
      ..writeByte(3)
      ..write(obj.ownerMobile)
      ..writeByte(4)
      ..write(obj.dateToExpair);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MembershipsTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
