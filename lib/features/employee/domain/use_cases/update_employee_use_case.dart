import 'package:dartz/dartz.dart';
import 'package:gymna/features/employee/domain/entities/employee.dart';

import '../../../../core/error/failures.dart';
import '../repositories/employee_repositry.dart';

class UpdateEmployeeUseCase {
  final EmployeeRepositry repository;

  UpdateEmployeeUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Employee employee) async {
    return await repository.updateMembership(employee);
  }
}
