import 'package:dartz/dartz.dart';
import 'package:gymna/features/employee/domain/entities/employee.dart';

import '../../../../core/error/failures.dart';

abstract class EmployeeRepositry {
  Future<Either<Failure, Unit>> addEmployee(Employee employee);

  Future<Either<Failure, List<Employee>>> getAllEmployees();

  Future<Either<Failure, Unit>> updateMembership(Employee employee);

  Future<Either<Failure, Employee>> getEmployee(int employeeId);
}
