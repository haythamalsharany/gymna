import 'package:dartz/dartz.dart';
import 'package:gymna/features/payroll/domain/entities/payroll.dart';

import '../../../../core/error/failures.dart';
import '../repositories/payroll_repositry.dart';

class GetPayrollUsecase {
  final PayrollRepositry repositry;

  GetPayrollUsecase({required this.repositry});

  Future<Either<Failure, Payroll>> call(int payrollId) async {
    return await repositry.getPayroll(payrollId);
  }
}