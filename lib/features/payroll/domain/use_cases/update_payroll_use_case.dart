



import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/payroll.dart';
import '../repositories/payroll_repositry.dart';

class UpdatePaylorUsecase {
  final PayrollRepositry repositry;

  UpdatePaylorUsecase({required this.repositry});

  Future<Either<Failure, Unit>> call(Payroll payroll) async {
    return await repositry.updatePayroll(payroll);
  }
}