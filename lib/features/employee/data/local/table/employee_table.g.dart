// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeTebleAdapter extends TypeAdapter<EmployeeTeble> {
  @override
  final int typeId = 1;

  @override
  EmployeeTeble read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeTeble(
      employeeId: fields[0] as int,
      employeeAge: fields[1] as String,
      employeeName: fields[2] as String,
      employeeType: fields[3] as String,
      employeeMobile: fields[4] as String,
      employeeAddress: fields[5] as String,
      employeeMaritalStatus: fields[6] as String,
      dateOfGiveJob: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeTeble obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.employeeId)
      ..writeByte(1)
      ..write(obj.employeeAge)
      ..writeByte(2)
      ..write(obj.employeeName)
      ..writeByte(3)
      ..write(obj.employeeType)
      ..writeByte(4)
      ..write(obj.employeeMobile)
      ..writeByte(5)
      ..write(obj.employeeAddress)
      ..writeByte(6)
      ..write(obj.employeeMaritalStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeTebleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
