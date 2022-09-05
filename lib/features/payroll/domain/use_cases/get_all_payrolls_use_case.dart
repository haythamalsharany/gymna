

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/payroll.dart';
import '../repositories/payroll_repositry.dart';

class GetAllPayrollsUsecase {
  final PayrollRepositry repositry;

  GetAllPayrollsUsecase({required this.repositry});

  Future<Either<Failure, List<Payroll>>> call() async {
    return await repositry.getPayrolls();
  }
}