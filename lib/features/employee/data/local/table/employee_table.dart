import 'package:gymna/features/employee/data/local/models/employee_model.dart';
import 'package:gymna/features/employee/domain/entities/employee.dart';
import 'package:hive/hive.dart';

part 'employee_table.g.dart';

@HiveType(typeId: 1)
class EmployeeTeble extends EmployeeModel {
  @override
  @HiveField(0)
  final int employeeId;
  @override
  @HiveField(1)
  final String employeeAge;
  @override
  @HiveField(2)
  final String employeeName;
  @override
  @HiveField(3)
  final String employeeType;
  @override
  @HiveField(4)
  final String employeeMobile;
  @override
  @HiveField(5)
  final String employeeAddress;
  @override
  @HiveField(6)
  final String employeeMaritalStatus;
  final String dateOfGiveJob;

  EmployeeTeble({
    required this.dateOfGiveJob,
    required this.employeeId,
    required this.employeeAge,
    required this.employeeName,
    required this.employeeType,
    required this.employeeMobile,
    required this.employeeAddress,
    required this.employeeMaritalStatus,
  }) : super(
          dateOfGiveJob: dateOfGiveJob,
          employeeAddress: employeeAddress,
          employeeAge: employeeAge,
          employeeId: employeeId,
          employeeMaritalStatus: employeeMaritalStatus,
          employeeMobile: employeeMobile,
          employeeName: employeeName,
          employeeType: employeeType,
        );

  factory EmployeeTeble.fromEmployee(Employee employee) {
    return EmployeeTeble(
      dateOfGiveJob: employee.dateOfGiveJob,
      employeeAddress: employee.employeeAddress,
      employeeAge: employee.employeeAge,
      employeeId: employee.employeeId,
      employeeMaritalStatus: employee.employeeMaritalStatus,
      employeeMobile: employee.employeeMobile,
      employeeName: employee.employeeName,
      employeeType: employee.employeeType,
    );
  }
}
