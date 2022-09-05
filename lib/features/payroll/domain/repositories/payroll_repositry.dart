

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/payroll.dart';

abstract class PayrollRepositry {
  Future<Either<Failure, Unit>> addPayroll(Payroll payroll);
  Future<Either<Failure, List<Payroll>>> getPayrolls();
  Future<Either<Failure, Payroll>> getPayroll(int payrollId);
  Future<Either<Failure, Unit>> updatePayroll(Payroll payroll);
}