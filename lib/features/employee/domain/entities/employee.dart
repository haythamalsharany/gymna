import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final int employeeId;
  final String employeeName;
  final String employeeMobile;

  final String employeeType;
  final String employeeAge;
  final String employeeAddress;
  final String employeeMaritalStatus;
  final String dateOfGiveJob;

  const Employee({
    required this.dateOfGiveJob,
    required this.employeeId,
    required this.employeeName,
    required this.employeeMobile,
    required this.employeeType,
    required this.employeeAge,
    required this.employeeAddress,
    required this.employeeMaritalStatus,
  });

  @override
  List<Object?> get props => [];
}
