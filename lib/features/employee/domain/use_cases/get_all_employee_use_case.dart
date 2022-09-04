import 'package:dartz/dartz.dart';
import 'package:gymna/features/employee/domain/entities/employee.dart';

import '../../../../core/error/failures.dart';
import '../repositories/employee_repositry.dart';

class GetAllEmployeesUseCase {
  final EmployeeRepositry repository;

  GetAllEmployeesUseCase(this.repository);

  Future<Either<Failure, List<Employee>>> call() async {
    return await repository.getAllEmployees();
  }
}
