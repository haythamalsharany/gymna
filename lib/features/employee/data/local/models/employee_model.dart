import 'package:gymna/features/employee/domain/entities/employee.dart';

class EmployeeModel extends Employee {
  EmployeeModel({
    required String dateOfGiveJob,
    required int employeeId,
    required String employeeAge,
    required String employeeName,
    required String employeeType,
    required String employeeMobile,
    required String employeeAddress,
    required String employeeMaritalStatus,
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

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      dateOfGiveJob: json['dateOfGiveJob'],
      employeeId: json['employeeId'],
      employeeName: json['employeeName'],
      employeeAge: json['employeeAge'],
      employeeMobile: json['employeeMobile'],
      employeeAddress: json['employeeAddress'],
      employeeMaritalStatus: json['employeeMaritalStatus'],
      employeeType: json['employeeType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dateOfGiveJob': dateOfGiveJob,
      'employeeId': employeeId,
      'employeeName': employeeName,
      'employeeAge': employeeAge,
      'employeeMobile': employeeMobile,
      'employeeAddress': employeeAddress,
      'employeeMaritalStatus': employeeMaritalStatus,
      'employeeType': employeeType,
    };
  }
}
