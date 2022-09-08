import 'package:dartz/dartz.dart';
import 'package:gymna/features/employee/data/local/models/employee_model.dart';
import 'package:hive/hive.dart';

abstract class EmployeeLocalDataSource {
  Future<List<EmployeeModel>> getAllLocalEmployees();
  Future<List<EmployeeModel>> searchLocalEmployees(String searchText);

  Future<Unit> addEmployee(EmployeeModel employeeModel);

  Future<Unit> updateEmployee(EmployeeModel employee);

  Future<EmployeeModel> getEmployee(int employeeId);
}

class EmployeeLocalDataSourceImpl extends EmployeeLocalDataSource {
  @override
  Future<Unit> addEmployee(EmployeeModel employeeModel) async {
    final employeesBox = await Hive.openBox('employeesBox');

    await employeesBox.put(employeeModel.employeeId, employeeModel);

    return unit;
  }

  @override
  Future<List<EmployeeModel>> getAllLocalEmployees() async {
    final employeesBox = await Hive.openBox('employeesBox');

    final employeeIds = employeesBox.keys;
    List<EmployeeModel> employees = [];
    for (var employeeId in employeeIds) {
      final employee = employeesBox.get(employeeId);
      if (employee != null) {
        employees.add(employee);
      }
    }
    return employees;
  }

  @override
  Future<EmployeeModel> getEmployee(int employeeId) async {
    final employeesBox = await Hive.openBox('employeesBox');
    EmployeeModel employee = employeesBox.get(employeeId);
    return employee;
  }

  @override
  Future<Unit> updateEmployee(EmployeeModel employee) async {
    final employeesBox = await Hive.openBox('employeesBox');

    await employeesBox.put(employee.employeeId, employee);

    return unit;
  }
  
  @override
  Future<List<EmployeeModel>> searchLocalEmployees(String searchText) async {
  
  
    final employeesBox = await Hive.openBox('employeesBox');

    final employeeIds = employeesBox.keys;
    List<EmployeeModel> employees = [];
    for (var employeeId in employeeIds) {
    EmployeeModel  employee = employeesBox.get(employeeId);
      
      if (employee != null && employee.employeeName.contains(searchText)) {
        employees.add(employee);
      }

    }
    
    return employees;
  }
  
}
