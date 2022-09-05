// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payroll_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PayrollTableAdapter extends TypeAdapter<PayrollTable> {
  @override
  final int typeId = 2;

  @override
  PayrollTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PayrollTable(
      payrollId: fields[0] as int,
      payrollAmount: fields[2] as int,
      payrollOwnerId: fields[1] as int,
      payrollOwnerName: fields[3] as String,
      payrollDate: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PayrollTable obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.payrollId)
      ..writeByte(1)
      ..write(obj.payrollOwnerId)
      ..writeByte(2)
      ..write(obj.payrollAmount)
      ..writeByte(3)
      ..write(obj.payrollOwnerName)
      ..writeByte(4)
      ..write(obj.payrollDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PayrollTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
