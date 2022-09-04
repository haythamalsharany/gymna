import 'package:dartz/dartz.dart';
import 'package:gymna/features/employee/domain/entities/employee.dart';
import 'package:gymna/features/employee/domain/repositories/employee_repositry.dart';

import '../../../../core/error/failures.dart';

class AddEmployeeUsecase {
  final EmployeeRepositry repository;

  AddEmployeeUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Employee employee) async {
    return await repository.addEmployee(employee);
  }
}
